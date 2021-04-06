//
//  Game.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 28/03/2021.
//

import Foundation

struct Game {
    
    var target = Int.random(in: 1..<100)
    var score = 0
    var round = 1
    
    //    func points(sliderValue: Int) -> Int {
    //        var difference: Int
    //        if sliderValue > self.target {
    //            difference = sliderValue - self.target
    //        } else if self.target > sliderValue {
    //            difference = self.target - sliderValue
    //        } else {
    //            difference = 0
    //        }
    //        var awardedPoints: Int = 100 - difference
    //        return awardedPoints
    //    }
    
    // Jak jedna linia, to nie musi być rerutn. Wiele linii, musi być return.
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    // Mutating ponieważ zmienia wartości zmiennych struct.
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1..<100)
    }
    
    mutating func restart() {
        target = Int.random(in: 1..<100)
        score = 0
        round = 1
    }
}
