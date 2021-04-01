//
//  ViewController.swift
//  DolbomiBluetooth_Testing
//
//  Created by DohyunKim on 2021/03/29.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    private var centralManager: CBCentralManager!
    var discoverPeripherals = [CBPeripheral]()
    var connectedPeripherals: CBPeripheral?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScan() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func connect(peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }
    
    func disconnect(peripheral: CBPeripheral) {
        centralManager.cancelPeripheralConnection(peripheral)
    }
    
    func discoverService(peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
    
    func discoverCharacteristics(peripheral: CBPeripheral) {
        guard let services = peripheral.services else {
            return
        }
        for service in services{
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func discoverDescriptors(peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        peripheral.discoverDescriptors(for: characteristic)
    }


}

extension ViewController: CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("Powered On")
        case .poweredOff:
            print("Error: Powered Off")
        // 사용자에게 블루투스를 켜도록 경고
        case .resetting:
            print("Error: Resetting")
        // 다음 상태 업데이트를 기다렸다가 Bluetooth 서비스 중단 로깅 고려
        case .unauthorized:
            print("Error: Unauthorized")
        // 앱 설정에서 블루투스 권한을 사용하도록 사용자에게 알림
        case .unsupported:
            print("Error: Unsupported")
        // 사용자에게 기기가 블루투스를 지원하지 않으며 앱이 예상대로 작동하지 않음을 알립니다.
        case .unknown:
            print("Error: Unknown")
        // 다음 상태 업데이트를 기다립니다.
        @unknown default:
            fatalError()
        }
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        self.discoverPeripherals.append(peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        self.connectedPeripherals = peripheral
        peripheral.delegate = self
        print("Connect")
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error as Any)
        fatalError()
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let error = error {
            print(error)
            fatalError()
        }
        print("Successfully DisConnected")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {
            return
        }
        discoverCharacteristics(peripheral: peripheral)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else {
            return
        }
        
        //여기서 저장하거나 특성을 읽고 쓰고 할 수 있음.
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        guard let descriptors = characteristic.descriptors else {
            return
        }
        
        if let userDescriptionDescriptor = descriptors.first(where: {
            return $0.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString
        }) {
            peripheral.readValue(for: userDescriptionDescriptor)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        if descriptor.uuid.uuidString == CBUUIDCharacteristicUserDescriptionString,
           let userDescription = descriptor.value as? String {
            print("Characterstic \(descriptor.characteristic.uuid.uuidString) is also known as \(userDescription)")
        }
    }
    
    
    
    
    
}

