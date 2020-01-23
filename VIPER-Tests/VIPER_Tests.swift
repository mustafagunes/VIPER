//
//  VIPER_Tests.swift
//  VIPER-Tests
//
//  Created by Mustafa GUNES on 23.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import XCTest
@testable import viper_exam

private struct City: Decodable {
    var id: Int
    var name: String
    var location: CityLocation
    var url: String
}

private struct CityLocation: Decodable {
    var latitude: Double
    var longitude: Double
}

final class VIPER_Tests: XCTestCase {

    private var mockJsonData: Data {
        return #"{"id": 1, "name": "Şanlıurfa", "url": "https://cdn.pixabay.com/photo/2017/09/27/20/55/sanliurfa-2793424_1280.jpg", "location": { "latitude": 36.9751, "longitude": 38.4243 }}"#.data(using: .utf8)!
    }

    private var invalidMockJsonData: Data {
         #"{"id": "1", "name": "Şanlıurfa", "url": "https://cdn.pixabay.com/photo/2017/09/27/20/55/sanliurfa-2793424_1280.jpg", "location": { "latitude": "36.9751", "longitude": "38.4243" }}"#.data(using: .utf8)!
    }

    func testDecodeModel() {
        guard let city = City.init(from: mockJsonData) else {
            XCTAssert(false, "Could not parse model")
            return
        }

        XCTAssertEqual(city.id, 1)
        XCTAssertEqual(city.name, "Şanlıurfa")
        XCTAssertEqual(city.location.latitude, 36.9751)
        XCTAssertEqual(city.location.longitude, 38.4243)
        XCTAssertEqual(city.url, "https://cdn.pixabay.com/photo/2017/09/27/20/55/sanliurfa-2793424_1280.jpg")
    }

    func testDecodeModelInvalidData() {
        XCTAssertNil(City.init(from: invalidMockJsonData))
    }
    
    func testUsersRequest() {
        
        let exeption = self.expectation(description: "Get Users")
        
        let request = GetUserRequest()
        request.fetchData(success: { (result) in
            Logger.log(output: result)
            exeption.fulfill()
            XCTAssert(true, "success")
        }) { (error) in
            switch error {
            case .serviceError( _, let message):
                Logger.log(output: message)
            default:
                break
            }
            exeption.fulfill()
            XCTAssert(true, "error")
        }
        
        self.waitForExpectations(timeout: 10, handler: nil)
    }
}
