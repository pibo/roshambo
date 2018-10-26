//
//  Move.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 27/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation
import UIKit

enum Move: String, CaseIterable {
    case rock, paper, scissors
    
    var image: UIImage! {
        return UIImage(named: rawValue)
    }
    
    static func random() -> Move! {
        return Move.allCases.randomElement()
    }
    
    func defeats(_ opponent: Move) -> Bool {
        switch (self, opponent) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return true
        default:
            return false
        }
    }
}
