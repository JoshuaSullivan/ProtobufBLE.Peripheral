//
//  ViewController.swift
//  ProtobufBTLE
//
//  Created by Joshua Sullivan on 5/5/17.
//  Copyright © 2017 The Nerdery. All rights reserved.
//

import UIKit
import CoreMotion

private let rad2Deg: Double = 180.0 / Double.pi

class ViewController: UIViewController {

    // MARK: Constants and Child Types
    
    // MARK: - IBOutlets

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    // MARK: - Properties
    
    fileprivate var updateTimer: Timer?
    
    fileprivate var motionManager: CMMotionManager = CMMotionManager()
    fileprivate var updateQueue = OperationQueue()
    
    fileprivate let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeStyle = .short
        df.dateStyle = .short
        return df
    }()
    
    fileprivate var motionData: CMDeviceMotion?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        motionManager.deviceMotionUpdateInterval = 0.5
        motionManager.startDeviceMotionUpdates(using: .xArbitraryZVertical, to: updateQueue, withHandler: handleMotionUpdate)
        updateTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
            [weak self] timer in
            guard let strongSelf = self else {
                timer.invalidate()
                return
            }
            strongSelf.update()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        motionManager.stopDeviceMotionUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Update Display
    
    fileprivate func update() {
        var packet = Packet()
        if let motionData = self.motionData {
            packet.rx = Int32(motionData.attitude.pitch * rad2Deg)
            packet.ry = Int32(motionData.attitude.yaw * rad2Deg)
            packet.rz = Int32(motionData.attitude.roll * rad2Deg)
            xLabel.text = String(format: "x: %i", packet.rx)
            yLabel.text = String(format: "y: %i", packet.ry)
            zLabel.text = String(format: "z: %i", packet.rz)
        }
        let now = Date()
        let time = dateFormatter.string(from: now)
        self.timeLabel.text = time
        
        packet.time = Float(now.timeIntervalSinceReferenceDate)
        guard let data = try? packet.serializedData() else {
            NSLog("Unable to create data from protocol buffer.")
            return
        }
        
        BLEPeripheralService.shared.update(protoValue: data)
    }

    // MARK: - Handle Gyroscope
    
    fileprivate func handleMotionUpdate(motionData: CMDeviceMotion?, error: Error?) {
        guard let data = motionData else {
            if let error = error {
                NSLog("Failed to get motion data: \(error.localizedDescription)")
            } else {
                NSLog("Failed to get motion data for an unknown reason.")
            }
            return
        }
        DispatchQueue.main.async {
            self.motionData = data
        }
    }
    
    
    
}

