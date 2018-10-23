//
//  Move.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 27/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation

enum Move: String {
    case rock, paper, scissors
    
    static func random() -> Move! {
        let options = ["rock", "paper", "scissors"]
        
        // Swift 4.1
        // let randomElement = options[Int(arc4random_uniform(UInt32(options.count)))]
        
        // Swift 4.2
        let randomElement: String! = options.randomElement()
        
        return Move(rawValue: randomElement)
    }
}
