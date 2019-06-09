//
//  WebTestingUsingXCUITestUITests.swift
//  WebTestingUsingXCUITestUITests
//
//  Created by Eugene Berezin on 6/8/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import XCTest

class WebTestingUsingXCUITestUITests: XCTestCase {
    let chrome = XCUIApplication(bundleIdentifier: "com.google.chrome.ios")
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

    override func setUp() {
        
        continueAfterFailure = false

        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChrome() {
        
        let searchField = chrome.collectionViews["ContentSuggestionsCollectionIdentifier"]/*@START_MENU_TOKEN@*/.buttons["Search or type URL"]/*[[".cells[\"CSHeaderIdentifier\"]",".buttons[\"NTPHomeFakeOmniboxAccessibilityID\"].buttons[\"Search or type URL\"]",".buttons[\"Search or type URL\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        let menuButton =  chrome.webViews/*@START_MENU_TOKEN@*/.buttons[" MENU"]/*[[".otherElements[\"Welcome to the blog about software testing and so much more! – My name is Eugene Berezin. I am a software engineer in test. In this blog I talk about how to get started in tech industry, make your product better and boost your career.\"]",".otherElements[\"banner\"]",".otherElements[\"navigation\"].buttons[\" MENU\"]",".buttons[\" MENU\"]",".otherElements.matching(identifier: \"navigation\").buttons[\" MENU\"]"],[[[-1,3],[-1,4],[-1,1,2],[-1,0,1]],[[-1,3],[-1,4],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        
        
        func type(word: String) {
            for char in word {
                chrome.keyboards.keys[String(char)].tap()
            }
        }
        chrome.launch()
        searchField.tap()
        type(word: "www.awesometester.com")
        chrome/*@START_MENU_TOKEN@*/.buttons["Go"]/*[[".keyboards.buttons[\"Go\"]",".buttons[\"Go\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        guard menuButton.waitForExistence(timeout: 30) else {
            XCTFail("Menu button is not visible or the website is not uploaded.")
            return
        }
        menuButton.tap()
        chrome.webViews/*@START_MENU_TOKEN@*/.staticTexts["About"]/*[[".otherElements[\"Welcome to the blog about software testing and so much more! – My name is Eugene Berezin. I am a software engineer in test. In this blog I talk about how to get started in tech industry, make your product better and boost your career.\"]",".otherElements[\"banner\"]",".otherElements[\"navigation\"]",".links[\"About\"].staticTexts[\"About\"]",".staticTexts[\"About\"]",".otherElements.matching(identifier: \"navigation\")"],[[[-1,4],[-1,3],[-1,5,3],[-1,1,2],[-1,0,1]],[[-1,4],[-1,3],[-1,5,3],[-1,1,2]],[[-1,4],[-1,3],[-1,2,3]],[[-1,4],[-1,3]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(chrome.webViews/*@START_MENU_TOKEN@*/.staticTexts["About"]/*[[".otherElements[\"Welcome to the blog about software testing and so much more! – My name is Eugene Berezin. I am a software engineer in test. In this blog I talk about how to get started in tech industry, make your product better and boost your career.\"]",".otherElements[\"banner\"]",".otherElements[\"navigation\"]",".links[\"About\"].staticTexts[\"About\"]",".staticTexts[\"About\"]",".otherElements.matching(identifier: \"navigation\")"],[[[-1,4],[-1,3],[-1,5,3],[-1,1,2],[-1,0,1]],[[-1,4],[-1,3],[-1,5,3],[-1,1,2]],[[-1,4],[-1,3],[-1,2,3]],[[-1,4],[-1,3]]],[0]]@END_MENU_TOKEN@*/.exists, "About secition is not visible")
        
        
    }
    
    func testSafari() {
        let app = XCUIApplication()
        // Ensure that safari is running in foreground before we continue
        _ = safari.wait(for: .runningForeground, timeout: 30)
        
        let searchField = safari.buttons["URL"]
        let searchFieldAsTextField = safari/*@START_MENU_TOKEN@*/.textFields["URL"]/*[[".otherElements[\"BrowserWindow\"]",".textFields[\"Search or enter website name\"]",".textFields[\"URL\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        let selectAll = safari.menuItems["Select All"]
        let deleteKey = safari.keys["delete"]
        
        func type(word: String) {
            for char in word {
                safari.keyboards.keys[String(char)].tap()
            }
        }
        safari.launch()
        searchField.tap()
        type(word: "www.awesometester.com")
        safari/*@START_MENU_TOKEN@*/.keyboards.buttons["Go"]/*[[".keyboards.buttons[\"Go\"]",".buttons[\"Go\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        _ = app.wait(for: .runningForeground, timeout: 5)
        safari/*@START_MENU_TOKEN@*/.otherElements["WebView"].webViews.buttons[" MENU"]/*[[".otherElements[\"BrowserWindow\"]",".scrollViews.otherElements[\"WebView\"].webViews",".otherElements[\"Welcome to the blog about software testing and so much more! – My name is Eugene Berezin. I am a software engineer in test. In this blog I talk about how to get started in tech industry, make your product better and boost your career.\"]",".otherElements[\"banner\"]",".otherElements[\"navigation\"].buttons[\" MENU\"]",".buttons[\" MENU\"]",".otherElements.matching(identifier: \"navigation\").buttons[\" MENU\"]",".otherElements[\"WebView\"].webViews"],[[[-1,7,2],[-1,1,2],[-1,0,1]],[[-1,7,2],[-1,1,2]],[[-1,5],[-1,6],[-1,3,4],[-1,2,3]],[[-1,5],[-1,6],[-1,3,4]],[[-1,5],[-1,4]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        _ = app.wait(for: .runningForeground, timeout: 5)
        
        guard safari.otherElements["WebView"].webViews.staticTexts["About"].waitForExistence(timeout: 5) else {
            XCTFail("Element not found")
            return
        }
        safari.otherElements["WebView"].webViews.staticTexts["About"].tap()
        _ = app.wait(for: .runningForeground, timeout: 5)
        
        XCTAssert(safari.otherElements["WebView"].webViews.staticTexts["About"].exists, "App is no the wrong screen")
        
        
    }
    
        
    }


