//
//  ServicesTests.swift
//  EventsTests
//
//  Created by Thibault Lepez on 06/04/2021.
//

import XCTest

@testable import Events

class ServicesTests: XCTestCase {

    func testJSONLoadingError() throws {
        XCTAssertThrowsError(Events.load("test.json") as [Sponsor])
    }

    func testAPIWithWrongURL() throws {
        Events.ApiService.call(Speaker.self, url: "error.com", completionHandler: {
            _ in
        }, errorHandler: { _ in })
    }
    
    func testAPIWithWrongEndpoint() throws {
        Events.ApiService.call(Speaker.self, url: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Speakers%20%26%20attendees/wrongId", completionHandler: {
            _ in
        }, errorHandler: { _ in })
    }
    
    func testAPIWithWrongData() throws {
        Events.ApiService.call(Speaker.self, url: "https://api.airtable.com/v0/appXKn0DvuHuLw4DV/Speakers%20%26%20attendees", completionHandler: {
            _ in
        }, errorHandler: { _ in })
    }

}
