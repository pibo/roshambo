//
//  ViewController.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 26/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let controller = segue.destination as! MatchResultViewController
            let button = sender as! UIButton
            let playerMove: Move;
            
            switch button.tag {
            case 1:
                playerMove = .paper
            case 2:
                playerMove = .scissors
            default:
                playerMove = .rock
            }
            
            controller.result = MatchResult(playerMove: playerMove, opponentMove: Move.random())
        }
    }
    
    @IBAction func rockTapped() {
        let result = MatchResult(playerMove: .rock, opponentMove: Move.random())
        let controller = storyboard?.instantiateViewController(withIdentifier: "MatchResultViewController") as! MatchResultViewController
        
        controller.result = result
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showResults", sender: sender)
    }
}
