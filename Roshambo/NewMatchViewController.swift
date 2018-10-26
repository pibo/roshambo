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
    
    var match: Match?

    // MARK: Outlets
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func chooseMove(_ sender: UIButton) {
        switch sender {
        case rockButton:
            match = Match(playerMove: .rock)
            let controller = storyboard?.instantiateViewController(withIdentifier: "MatchResultViewController") as! MatchResultViewController
            controller.match = match
            present(controller, animated: true, completion: nil)
        case paperButton:
            match = Match(playerMove: .paper)
            performSegue(withIdentifier: "goToMatchResult", sender: self)
        case scissorsButton:
            match = Match(playerMove: .scissors)
        default:
            assert(false, "Unknown button called chooseMove!")
        }
    }
    
    // MARK: Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MatchResultViewController
        controller.match = match
    }
}
