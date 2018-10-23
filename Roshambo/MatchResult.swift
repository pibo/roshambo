//
//  MatchResult.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 27/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation

struct MatchResult {
    
    // MARK: computed properties
    var drew: Bool {
        return playerMove == opponentMove
    }
    
    var playerWon: Bool {
        switch (playerMove, opponentMove) {
        case (.scissors, .paper), (.paper, .rock), (.rock, .scissors):
            return true
        default:
            return false
        }
    }
    
    let playerMove: Move
    let opponentMove: Move
}
