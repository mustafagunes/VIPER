//
//  VIPER_UITests.swift
//  VIPER-UITests
//
//  Created by Mustafa GUNES on 23.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

import XCTest

class VIPER_UITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testPosts() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Posts"].tap()
        
        let verticalScrollBar15PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 15 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 15 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar15PagesCollectionView.swipeUp()
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"optio molestias id quia eum").element.swipeUp()
        verticalScrollBar15PagesCollectionView.swipeUp()
    }
    
    func testComments() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Comments"].tap()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Lew@alysha.tv"]/*[[".cells.staticTexts[\"Lew@alysha.tv\"]",".staticTexts[\"Lew@alysha.tv\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 70 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 70 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    }
    
    func testAlbums() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Albums"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells.containing(.staticText, identifier:"et rem non provident vel ut").children(matching: .other).element.swipeUp()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["adipisci laborum fuga laboriosam"]/*[[".cells.staticTexts[\"adipisci laborum fuga laboriosam\"]",".staticTexts[\"adipisci laborum fuga laboriosam\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        collectionViewsQuery.cells.containing(.staticText, identifier:"aperiam doloremque nihil").children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 4 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 4 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
    }
    
    func testPhoto() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Photos"].tap()
        
        let verticalScrollBar265PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 265 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 265 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar265PagesCollectionView.swipeUp()
        verticalScrollBar265PagesCollectionView.swipeUp()
        
    }
    
    func testTodos() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Todos"].tap()
        
        let verticalScrollBar26PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 26 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 26 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar26PagesCollectionView.swipeUp()
        verticalScrollBar26PagesCollectionView.swipeUp()
    }
    
    func testUsers() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Users"].tap()
        
        let verticalScrollBar5PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 5 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 5 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar5PagesCollectionView.swipeUp()
        verticalScrollBar5PagesCollectionView.swipeUp()
        verticalScrollBar5PagesCollectionView.swipeDown()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
