//
//  BLEPeripheralService.swift
//  ProtobufBTLE
//
//  Created by Joshua Sullivan on 5/5/17.
//  Copyright © 2017 The Nerdery. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLEPeripheralService: NSObject {
    
    // MARK: - Singleton
    private static let _shared: BLEPeripheralService = BLEPeripheralService()
    class var shared: BLEPeripheralService {
        return _shared
    }
    
    // MARK: - Properties
    var manager: CBPeripheralManager
    
    var service: CBMutableService
    var characteristic: CBMutableCharacteristic
    
    override init() {
        manager = CBPeripheralManager()
        characteristic = CBMutableCharacteristic(type: BLEIdentifiers.Characteristics.attitude,
                                                 properties: [.notify, .read],
                                                 value: nil,
                                                 permissions: [.readable])
        service = CBMutableService(type: BLEIdentifiers.Services.protoBuf, primary: true)
        service.characteristics = [characteristic]
        super.init()
        manager.delegate = self
    }
    
    func startAdvertising() {
        guard manager.state == .poweredOn else {
            return
        }
        NSLog("Starting BLE advertising.")
        manager.add(service)
        manager.startAdvertising([
            CBAdvertisementDataServiceUUIDsKey : [BLEIdentifiers.Services.protoBuf],
            CBAdvertisementDataLocalNameKey : "ProtobufBLE"
        ])
    }
    
    func stopAdvertising() {
        guard manager.state == .poweredOn else {
            return
        }
        NSLog("Stopping BLE advertising.")
        manager.stopAdvertising()
    }
    
    func update(protoValue: Data) {
        guard manager.state == .poweredOn else {
            return
        }
        NSLog("Updating characteristic value.")
        manager.updateValue(protoValue, for: characteristic, onSubscribedCentrals: nil)
    }
}

extension BLEPeripheralService: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            startAdvertising()
        default:
            break
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error {
            NSLog("Failed to add service: \(error.localizedDescription)")
            return
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            NSLog("Failed to start advertising: \(error.localizedDescription)")
            return
        }
    }
}
