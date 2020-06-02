//
//  main.swift
//  protocols-and-delegates
//
//  using macOS command line tool
//  to demo delegates and protocols
//
//  Created by Carlos Blandino on 6/2/20.
//  Copyright © 2020 Carlos Blandino. All rights reserved.
//

protocol ForkliftOperationalSupport {
    func driveForklift()
}


class WarehouseWorker {
    var delegate: ForkliftOperationalSupport?
    
    func audit() {
        print("performing an audit")
    }
    
    func storeIncomingShipment() {
        delegate?.driveForklift()
    }
}

struct ForkliftDriver: ForkliftOperationalSupport {
    init(handler: WarehouseWorker){
        handler.delegate = self
    }
    
    func driveForklift() {
        print("Forklift driver is driving the forklift and putting pallets away")
    }
}

var warehouseEmployee = WarehouseWorker()
var forkliftDriver = ForkliftDriver(handler: warehouseEmployee)

warehouseEmployee.audit()
warehouseEmployee.storeIncomingShipment()
