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
                                                 value: Data(),
                                                 permissions: [.readable])
        service = CBMutableService(type: BLEIdentifiers.Services.protoBuf, primary: true)
        service.characteristics = [characteristic]
        super.init()
        manager.delegate = self
        manager.add(service)
    }
    
    func startAdvertising() {
        NSLog("Starting BLE advertising.")
        manager.startAdvertising([ CBAdvertisementDataServiceUUIDsKey : [service.uuid] ])
    }
    
    func stopAdvertising() {
        NSLog("Stopping BLE advertising.")
        manager.stopAdvertising()
    }
    
    func update(protoValue: Data) {
        manager.updateValue(protoValue, for: characteristic, onSubscribedCentrals: nil)
    }
}

extension BLEPeripheralService: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        debugPrint("Peripheral manager changed state: \(peripheral.state)")
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
