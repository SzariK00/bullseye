//
//  Game.swift
//  Bullseye
//
//  Created by Adrian Jelonek on 28/03/2021.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    
    var target = Int.random(in: 1..<100)
    var score = 0
    var round = 1
    //Musimy wpisać, co ma zawierać lista, ponieważ poniżej tworzymy pustą listę.
    var leaderboardEntries: [LeaderboardEntry] = []
    
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
    mutating func addToLeaderboard(point: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1..<100)
        addToLeaderboard(point: points)
    }
    
    mutating func restart() {
        target = Int.random(in: 1..<100)
        score = 0
        round = 1
    }
}
