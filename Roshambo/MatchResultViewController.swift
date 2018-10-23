//
//  MatchResultsViewController.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 26/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class MatchResultViewController: UIViewController {
    
    var result: MatchResult?
    
    // MARK: outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var playerMoveImage: UIImageView!
    @IBOutlet var opponentMoveImage: UIImageView!
    @IBOutlet var resultMoveImage: UIImageView!
    @IBOutlet var resultMoveLabel: UILabel!
    
    // MARK: outlets to animate
    @IBOutlet var movesContainer: UIStackView!
    @IBOutlet var resultContainer: UIStackView!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: actions
    @IBAction func tappedPlayAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: life-cycle methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let result = result {
            
            // Set the main result label based on the result.
            if result.drew {
                resultLabel.text = "Draw!"
            } else {
                resultLabel.text = result.playerWon ? "You win!" : "You lose!"
            }
            
            // Set move images.
            playerMoveImage.image = UIImage(named: result.playerMove.rawValue)
            opponentMoveImage.image = UIImage(named: result.opponentMove.rawValue)
            
            // Set the result move label and image.
            switch (result.playerMove, result.opponentMove) {
            case (.paper, .rock), (.rock, .paper):
                resultMoveImage.image = UIImage(named: "PaperCoversRock")
                resultMoveLabel.text = "Paper covers rock"
            case (.scissors, .paper), (.paper, .scissors):
                resultMoveImage.image = UIImage(named: "ScissorsCutPaper")
                resultMoveLabel.text = "Scissors cut paper"
            case (.rock, .scissors), (.scissors, .rock):
                resultMoveImage.image = UIImage(named: "RockCrushesScissors")
                resultMoveLabel.text = "Rock crushes scissors"
            default:
                resultMoveImage.image = UIImage(named: "itsATie")
                resultMoveLabel.text = "At least you got a match!"
            }
        }
        
        // Hide elements to show with animation.
        movesContainer.alpha = 0
        resultContainer.alpha = 0
        playAgainButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Show elements with animation.
        UIView.animate(withDuration: 0.3, animations: { self.movesContainer.alpha = 1 }) { _ in
            UIView.animate(withDuration: 0.3, animations: { self.resultContainer.alpha = 1 }) { _ in
                UIView.animate(withDuration: 0.3, animations: { self.playAgainButton.alpha = 1 })
            }
        }
    }
}
