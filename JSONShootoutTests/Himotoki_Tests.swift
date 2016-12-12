//
//  Himotoki_Tests.swift
//  JSONShootout
//
//  Created by Florian Krüger on 12/12/2016.
//  Copyright © 2016 SwiftBit. All rights reserved.
//

import XCTest
import ModelObjects
import Himotoki

class Himotoki_Tests: XCTestCase {
    
    func testPerformance() {
        
        let dict: [String: Any] = try! JSONSerialization.jsonObject(with: self.data, options: []) as! [String: Any]
        
        self.measure {
            let programs: [Program] = try! decodeArray(dict, rootKeyPath: [ "ProgramList", "Programs" ])
            XCTAssert(programs.count > 1000)
        }
    }
    
    private lazy var data:Data = {
        let path = Bundle(for: type(of: self)).url(forResource: "Large", withExtension: "json")
        let data = try! Data(contentsOf: path!)
        return data
    }()
    
}
