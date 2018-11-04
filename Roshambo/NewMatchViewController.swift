//
//  NewMatchViewController.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 26/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class NewMatchViewController: UIViewController {
    
    // MARK: Properties
    
    var match: Match!
    var history = [Match]()

    // MARK: Outlets
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func chooseMove(_ sender: UIButton) {
        switch sender {
        case rockButton:
            match = Match(playerMove: .rock)
            history.append(match)
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "MatchResultViewController") as! MatchResultViewController
            controller.match = match
            navigationController?.pushViewController(controller, animated: true)
            
        case paperButton:
            match = Match(playerMove: .paper)
            history.append(match)
            performSegue(withIdentifier: "goToMatchResult", sender: self)
            
        case scissorsButton:
            match = Match(playerMove: .scissors)
            history.append(match)
            
        default:
            assert(false, "Unknown button called chooseMove!")
        }
    }
    
    // MARK: Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMatchResult" {
            let controller = segue.destination as! MatchResultViewController
            controller.match = match
        } else if segue.identifier == "goToMatchHistory" {
            let controller = segue.destination as! MatchHistoryViewController
            controller.history = history
        }
    }
}
