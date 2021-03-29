//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Adrian Jelonek on 28/03/2021.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!
    
// Przygotowanie do testów.
     override func setUpWithError() throws {
        game = Game()
    }
// Co ma się stać po testach.
    override func tearDownWithError() throws {
        game = nil
        
    }
// Tutaj wrzucamy scenariusz(e) korzystając z dostępnych Assertów.
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}
