//
//  bleTableViewController.swift
//  DolbomiBluetooth_Testing
//
//  Created by DohyunKim on 2021/05/10.
//

//import UIKit
//import CoreBluetooth
//
//var activeCentralManager: CBCentralManager?
//var peripheralDevice: CBPeripheral?
//var devices: Dictionary<String, CBPeripheral> = [:]
//var deviceName: String?
//var devicesRSSI = [NSNumber]()
//var devicesServices: CBService!
//var deviceCharacteristics: CBCharacteristic!
//
//class bleTableViewController: UITableViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        // Clear devices dictionary.
//        devices.removeAll(keepingCapacity: false)
//        devicesRSSI.removeAll(keepingCapacity: false)
//        // Initialize central manager on load
//        activeCentralManager = CBCentralManager(delegate: self, queue: nil)
//
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(update), for: UIControl.Event.valueChanged)
//        self.refreshControl = refreshControl
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//   @objc func update(){
//        // Clear devices dictionary.
//        devices.removeAll(keepingCapacity: false)
//        devicesRSSI.removeAll(keepingCapacity: false)
//        // Initialize central manager on load
//        activeCentralManager = CBCentralManager(delegate: self, queue: nil)
//        self.refreshControl?.endRefreshing()
//    }
//
//    // MARK: BLE
//
//    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        if let central = central{
//            if central.state == CBCentralManagerState.PoweredOn {
//                // Scan for peripherals if BLE is turned on
//                central.scanForPeripherals(withServices: nil, options: nil)
//                print("Searching for BLE Devices")
//            }
//            else {
//                // Can have different conditions for all states if needed - print generic message for now
//                print("Bluetooth switched off or not initialized")
//            }
//        }
//
//    }
//
//    // Check out the discovered peripherals to find Sensor Tag
//    private func centralManager(central: CBCentralManager?, didDiscoverPeripheral peripheral: CBPeripheral?, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
//
//        if central != nil{
//            if let peripheral = peripheral{
//                // Get this device's UUID.
//                if let name = peripheral.name{
//                    if(devices[name] == nil){
//                        devices[name] = peripheral
//                        devicesRSSI.append(RSSI)
//                        self.tableView.reloadData()
//                    }
//
//                }
//            }
//        }
//    }
//
//    // Discover services of the peripheral
//    func centralManager(central: CBCentralManager?, didConnectPeripheral peripheral: CBPeripheral?) {
//
//        if central != nil{
//            if peripheral != nil{
//                // Discover services for the device.
//                if let peripheralDevice = peripheralDevice{
//                    peripheralDevice.discoverServices(nil)
//                    if navigationController != nil{
//                        navigationItem.title = "Connected to \(deviceName)"
//                    }
//                }
//            }
//        }
//
//    }
//
//    private func peripheral(peripheral: CBPeripheral?, didDiscoverServices error: NSError!) {
//
//        if let peripheral = peripheral{
//        // Iterate through the services of a particular peripheral.
//            for service in peripheral.services! {
//                let thisService = service as? CBService
//                // Let's see what characteristics this service has.
//                if let thisService = thisService{
//                    peripheral.discoverCharacteristics(nil, for: thisService)
//                    if let navigationController = navigationController{
//                    navigationItem.title = "Discovered Service for \(deviceName)"
//                    }
//                }
//            }
//        }
//
//    }
//
//    private func peripheral(peripheral: CBPeripheral?, didDiscoverCharacteristicsForService service: CBService?, error: NSError?) {
//
//        if let peripheral = peripheral{
//
//            if let service = service{
//                // check the uuid of each characteristic to find config and data characteristics
//                for charateristic in service.characteristics! {
//                    let thisCharacteristic = charateristic
//                    // Set notify for characteristics here.
//                    peripheral.setNotifyValue(true, for: thisCharacteristic)
//
//                    if navigationController != nil{
//                        navigationItem.title = "Discovered Characteristic for \(deviceName)"
//                    }
//                    deviceCharacteristics = thisCharacteristic
//                }
//                // Now that we are setup, return to main view.
//                if let navigationController = navigationController{
//                    navigationController.popViewController(animated: true)
//                }
//            }
//        }
//    }
//
//    // Get data values when they are updated
//    private func peripheral(peripheral: CBPeripheral?, didUpdateValueForCharacteristic characteristic: CBCharacteristic?, error: NSError!) {
//        print("Got some!")
//    }
//
//    func cancelConnection(){
//        if let activeCentralManager = activeCentralManager{
//            print("Died!")
//            if let peripheralDevice = peripheralDevice{
//                //println(peripheralDevice)
//                activeCentralManager.cancelPeripheralConnection(peripheralDevice)
//            }
//        }
//    }
//
//    // If disconnected, start searching again
//    private func centralManager(central: CBCentralManager?, didDisconnectPeripheral peripheral: CBPeripheral?, error: NSError?) {
//        if let central = central{
//            if peripheral != nil{
//                print("Disconnected")
//                central.scanForPeripherals(withServices: nil, options: nil)
//            }
//        }
//    }
//
//    func writeValue(data: String){
//        let data = (data as NSString).data(using: String.Encoding.utf8.rawValue)
//        if let peripheralDevice = peripheralDevice{
//            if let deviceCharacteristics = deviceCharacteristics{
//                peripheralDevice.writeValue(data!, for: deviceCharacteristics, type: CBCharacteristicWriteType.withoutResponse)
//            }
//        }
//    }
//
//// MARK: TableView
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return devices.count
//    }
//
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//
//        // Let's get a cell.
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        // Turn the device dictionary into an array.
//        let discoveredPeripheralArray = devices.values.array
//        //println(discoveredPeripheralArray.count)
//
//        // Set the main label of the cell to the name of the corresponding peripheral.
//        if let cell = cell{
//            if let name = discoveredPeripheralArray[indexPath.row].name{
//                if let textLabelText = cell.textLabel{
//                    textLabelText.text = name
//                }
//                if let detailTextLabel = cell.detailTextLabel{
//                    detailTextLabel.text = devicesRSSI[indexPath.row].stringValue
//                }
//            }
//        }
//        return cell!
//    }
//
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//
//
//        if (devices.count > 0){
//            // Get an array of peripherals.
//            let discoveredPeripheralArray = devices.values.array
//
//            // Set the peripheralDevice to the corresponding row selected.
//            peripheralDevice = discoveredPeripheralArray[indexPath.row]
//
//            // Attach the peripheral delegate.
//            if let peripheralDevice = peripheralDevice{
//                peripheralDevice.delegate = self
//                deviceName = peripheralDevice.name!
//            }
//            else
//            {
//                deviceName = " "
//            }
//
//            if let activeCentralManager = activeCentralManager{
//                // Stop looking for more peripherals.
//                activeCentralManager.stopScan()
//                // Connect to this peripheral.
//                activeCentralManager.connect(peripheralDevice!, options: nil)
//                if let navigationController = navigationController{
//                    navigationItem.title = "Connecting \(deviceName)"
//                }
//            }
//        }
//    }
//
//
//
//}
//
//extension bleTableViewController: UITableViewDelegate, UITableViewDataSource {
//
//}
