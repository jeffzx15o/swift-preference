//
//  Preference.swift
//
//  Copyright (c) 2022 Junfeng Zhang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

///
/// NOTE: This file was generated by gyb.py
///
/// Do NOT edit this file directly as it will be regenerated automatically when needed.
///

import Combine
import XCTest
@testable import Preference

extension String {
    static func random(_ length: Int = 16) -> String {
        String((0..<length).map { _ in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
        })
    }
}

let store: UserDefaults = .init(suiteName: UUID().uuidString)!

class PreferenceTests: XCTestCase {

    struct Preferences {
        @Preference("DefaultName.StringValue", store: store) var stringValue: String = "yCtoi4BR"
        @Preference("DefaultName.OptionalStringValue", store: store) var optionalStringValue: String?
        @Preference("DefaultName.IntValue", store: store) var intValue: Int = 8
        @Preference("DefaultName.OptionalIntValue", store: store) var optionalIntValue: Int?
        @Preference("DefaultName.DoubleValue", store: store) var doubleValue: Double = 0.730964920633
        @Preference("DefaultName.OptionalDoubleValue", store: store) var optionalDoubleValue: Double?
        @Preference("DefaultName.FloatValue", store: store) var floatValue: Float = 1.314
        @Preference("DefaultName.OptionalFloatValue", store: store) var optionalFloatValue: Float?
        @Preference("DefaultName.URLValue", store: store) var urlValue: URL = URL(fileURLWithPath: "NOugvfZk")
        @Preference("DefaultName.OptionalURLValue", store: store) var optionalURLValue: URL?
        @Preference("DefaultName.BoolValue", store: store) var boolValue: Bool = true
        @Preference("DefaultName.OptionalBoolValue", store: store) var optionalBoolValue: Bool?
        @Preference("DefaultName.DataValue", store: store) var dataValue: Data = .init()
        @Preference("DefaultName.OptionalDataValue", store: store) var optionalDataValue: Data?
    }

    var preferences: Preferences = .init()
    var cancellable: Set<AnyCancellable> = .init()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        preferences = .init()
        cancellable.removeAll()
    }
        
    func testStoreStringPreferenceValue() {
        var stringValues: [String] = []
        var expectValues: [String] = ["yCtoi4BR"]
        
        cancellable.insert(
            preferences.$stringValue.sink {
                stringValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.stringValue, "yCtoi4BR")
        
        for _ in 0..<10 {
            let newValue = String.random()
            expectValues.append(newValue)
            preferences.stringValue = newValue
            XCTAssertEqual(preferences.stringValue, newValue)
            XCTAssertEqual(store.string(forKey: "DefaultName.StringValue"), newValue)
        }

        XCTAssertEqual(stringValues, expectValues)
    }
    
    func testStoreOptionalStringPreferenceValue() {
        var optionalStringValues: [String?] = []
        var expectValues: [String?] = [nil]
        
        cancellable.insert(
            preferences.$optionalStringValue.sink {
                optionalStringValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalStringValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalStringValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, String.random()]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalStringValue = newValue
            XCTAssertEqual(preferences.optionalStringValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalStringValue"))
            } else {
                XCTAssertEqual(store.string(forKey: "DefaultName.OptionalStringValue"), newValue)
            }
        }
        
        XCTAssertEqual(optionalStringValues, expectValues)
    }
        
    func testStoreIntPreferenceValue() {
        var intValues: [Int] = []
        var expectValues: [Int] = [8]
        
        cancellable.insert(
            preferences.$intValue.sink {
                intValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.intValue, 8)
        
        for _ in 0..<10 {
            let newValue = Int.random(in: 0...255)
            expectValues.append(newValue)
            preferences.intValue = newValue
            XCTAssertEqual(preferences.intValue, newValue)
            XCTAssertEqual(store.integer(forKey: "DefaultName.IntValue"), newValue)
        }

        XCTAssertEqual(intValues, expectValues)
    }
    
    func testStoreOptionalIntPreferenceValue() {
        var optionalIntValues: [Int?] = []
        var expectValues: [Int?] = [nil]
        
        cancellable.insert(
            preferences.$optionalIntValue.sink {
                optionalIntValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalIntValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalIntValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, Int.random(in: 0...255)]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalIntValue = newValue
            XCTAssertEqual(preferences.optionalIntValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalIntValue"))
            } else {
                XCTAssertEqual(store.integer(forKey: "DefaultName.OptionalIntValue"), newValue)
            }
        }
        
        XCTAssertEqual(optionalIntValues, expectValues)
    }
        
    func testStoreDoublePreferenceValue() {
        var doubleValues: [Double] = []
        var expectValues: [Double] = [0.730964920633]
        
        cancellable.insert(
            preferences.$doubleValue.sink {
                doubleValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.doubleValue, 0.730964920633)
        
        for _ in 0..<10 {
            let newValue = Double.random(in: 0...255)
            expectValues.append(newValue)
            preferences.doubleValue = newValue
            XCTAssertEqual(preferences.doubleValue, newValue)
            XCTAssertEqual(store.double(forKey: "DefaultName.DoubleValue"), newValue)
        }

        XCTAssertEqual(doubleValues, expectValues)
    }
    
    func testStoreOptionalDoublePreferenceValue() {
        var optionalDoubleValues: [Double?] = []
        var expectValues: [Double?] = [nil]
        
        cancellable.insert(
            preferences.$optionalDoubleValue.sink {
                optionalDoubleValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalDoubleValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalDoubleValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, Double.random(in: 0...255)]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalDoubleValue = newValue
            XCTAssertEqual(preferences.optionalDoubleValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalDoubleValue"))
            } else {
                XCTAssertEqual(store.double(forKey: "DefaultName.OptionalDoubleValue"), newValue)
            }
        }
        
        XCTAssertEqual(optionalDoubleValues, expectValues)
    }
        
    func testStoreFloatPreferenceValue() {
        var floatValues: [Float] = []
        var expectValues: [Float] = [1.314]
        
        cancellable.insert(
            preferences.$floatValue.sink {
                floatValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.floatValue, 1.314)
        
        for _ in 0..<10 {
            let newValue = Float.random(in: 0...255)
            expectValues.append(newValue)
            preferences.floatValue = newValue
            XCTAssertEqual(preferences.floatValue, newValue)
            XCTAssertEqual(store.float(forKey: "DefaultName.FloatValue"), newValue)
        }

        XCTAssertEqual(floatValues, expectValues)
    }
    
    func testStoreOptionalFloatPreferenceValue() {
        var optionalFloatValues: [Float?] = []
        var expectValues: [Float?] = [nil]
        
        cancellable.insert(
            preferences.$optionalFloatValue.sink {
                optionalFloatValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalFloatValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalFloatValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, Float.random(in: 0...255)]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalFloatValue = newValue
            XCTAssertEqual(preferences.optionalFloatValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalFloatValue"))
            } else {
                XCTAssertEqual(store.float(forKey: "DefaultName.OptionalFloatValue"), newValue)
            }
        }
        
        XCTAssertEqual(optionalFloatValues, expectValues)
    }
        
    func testStoreURLPreferenceValue() {
        var urlValues: [URL] = []
        var expectValues: [URL] = [URL(fileURLWithPath: "NOugvfZk")]
        
        cancellable.insert(
            preferences.$urlValue.sink {
                urlValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.urlValue, URL(fileURLWithPath: "NOugvfZk"))
        
        for _ in 0..<10 {
            let newValue = URL(fileURLWithPath: .random())
            expectValues.append(newValue)
            preferences.urlValue = newValue
            XCTAssertEqual(preferences.urlValue, newValue)
            XCTAssertEqual(store.url(forKey: "DefaultName.URLValue")?.absoluteURL.path, newValue.absoluteURL.path)
        }

        XCTAssertEqual(urlValues, expectValues)
    }
    
    func testStoreOptionalURLPreferenceValue() {
        var optionalURLValues: [URL?] = []
        var expectValues: [URL?] = [nil]
        
        cancellable.insert(
            preferences.$optionalURLValue.sink {
                optionalURLValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalURLValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalURLValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, URL(fileURLWithPath: .random())]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalURLValue = newValue
            XCTAssertEqual(preferences.optionalURLValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalURLValue"))
            } else {
                XCTAssertEqual(store.url(forKey: "DefaultName.OptionalURLValue")?.absoluteURL.path, newValue?.absoluteURL.path)
            }
        }
        
        XCTAssertEqual(optionalURLValues, expectValues)
    }
        
    func testStoreBoolPreferenceValue() {
        var boolValues: [Bool] = []
        var expectValues: [Bool] = [true]
        
        cancellable.insert(
            preferences.$boolValue.sink {
                boolValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.boolValue, true)
        
        for _ in 0..<10 {
            let newValue = Bool.random()
            expectValues.append(newValue)
            preferences.boolValue = newValue
            XCTAssertEqual(preferences.boolValue, newValue)
            XCTAssertEqual(store.bool(forKey: "DefaultName.BoolValue"), newValue)
        }

        XCTAssertEqual(boolValues, expectValues)
    }
    
    func testStoreOptionalBoolPreferenceValue() {
        var optionalBoolValues: [Bool?] = []
        var expectValues: [Bool?] = [nil]
        
        cancellable.insert(
            preferences.$optionalBoolValue.sink {
                optionalBoolValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalBoolValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalBoolValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, Bool.random()]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalBoolValue = newValue
            XCTAssertEqual(preferences.optionalBoolValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalBoolValue"))
            } else {
                XCTAssertEqual(store.bool(forKey: "DefaultName.OptionalBoolValue"), newValue)
            }
        }
        
        XCTAssertEqual(optionalBoolValues, expectValues)
    }
        
    func testStoreDataPreferenceValue() {
        var dataValues: [Data] = []
        var expectValues: [Data] = [.init()]
        
        cancellable.insert(
            preferences.$dataValue.sink {
                dataValues.append($0)
            }
        )
        
        XCTAssertEqual(preferences.dataValue, .init())
        
        for _ in 0..<10 {
            let newValue = Data((0...10).map { _ in UInt8.random(in: .min...UInt8.max)})
            expectValues.append(newValue)
            preferences.dataValue = newValue
            XCTAssertEqual(preferences.dataValue, newValue)
            XCTAssertEqual(store.data(forKey: "DefaultName.DataValue"), newValue)
        }

        XCTAssertEqual(dataValues, expectValues)
    }
    
    func testStoreOptionalDataPreferenceValue() {
        var optionalDataValues: [Data?] = []
        var expectValues: [Data?] = [nil]
        
        cancellable.insert(
            preferences.$optionalDataValue.sink {
                optionalDataValues.append($0)
            }
        )
        
        XCTAssertNil(preferences.optionalDataValue)
        XCTAssertNil(store.object(forKey: "DefaultName.OptionalDataValue"))
        
        for _ in 0..<10 {
            let allowedValues = [nil, Data((0...10).map { _ in UInt8.random(in: .min...UInt8.max)})]
            let newValue = allowedValues.randomElement()!
            expectValues.append(newValue)
            preferences.optionalDataValue = newValue
            XCTAssertEqual(preferences.optionalDataValue, newValue)
            if newValue == nil {
                XCTAssertNil(store.object(forKey: "DefaultName.OptionalDataValue"))
            } else {
                XCTAssertEqual(store.data(forKey: "DefaultName.OptionalDataValue"), newValue)
            }
        }
        
        XCTAssertEqual(optionalDataValues, expectValues)
    }
}
