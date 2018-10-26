//
//  Match.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 27/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation

struct Match {
    
    // MARK: Properties
    
    let date = Date()
    let playerMove: Move
    let opponentMove: Move = Move.random()
    
    // MARK: Computed Properties
    
    var draw: Bool {
        return playerMove == opponentMove
    }
    
    var winner: Move? {
        if draw { return nil }
        return playerMove.defeats(opponentMove) ? playerMove : opponentMove
    }
    
    var loser: Move? {
        if draw { return nil }
        return playerMove.defeats(opponentMove) ? opponentMove : playerMove
    }
}
