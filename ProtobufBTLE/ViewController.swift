//
//  ViewController.swift
//  ProtobufBTLE
//
//  Created by Joshua Sullivan on 5/5/17.
//  Copyright © 2017 The Nerdery. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    @IBOutlet weak var messageField: UITextField!
    
    // MARK: - Properties
    
    fileprivate var motionManager: CMMotionManager = CMMotionManager()
    fileprivate var gyroUpdateQueue = OperationQueue()
    
    fileprivate var gyroData: CMGyroData?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        motionManager.gyroUpdateInterval = 0.25
        motionManager.startGyroUpdates(to: gyroUpdateQueue, withHandler: handleGyroUpdate)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        motionManager.stopGyroUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Update Display
    
    fileprivate func update() {
        if let gyroData = gyroData {
            xLabel.text = String(format: "x: %0.2f", gyroData.rotationRate.x)
            yLabel.text = String(format: "y: %0.2f", gyroData.rotationRate.y)
            zLabel.text = String(format: "y: %0.2f", gyroData.rotationRate.z)
        }
        
    }

    // MARK: - Handle Gyroscope
    
    fileprivate func handleGyroUpdate(gyroData: CMGyroData?, error: Error?) {
        guard let data = gyroData else {
            if let error = error {
                NSLog("Failed to get gyroscope data: \(error.localizedDescription)")
            } else {
                NSLog("Failed to get gyroscope data for an unknown reason.")
            }
            return
        }
        DispatchQueue.main.async {
            self.gyroData = data
        }
    }
    
    
    
}

