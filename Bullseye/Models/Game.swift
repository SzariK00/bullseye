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
    
    func points(sliderValue: Int) -> Int {
        100 - abs(target - sliderValue)
    }
}
