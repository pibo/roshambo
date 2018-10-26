//
//  MatchResultViewController.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 26/09/2018.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class MatchResultViewController: UIViewController {
    
    // MARK: Properties
    
    var match: Match!
    
    let resultImages: [Move?: UIImage] = [
        .rock: UIImage(named: "RockCrushesScissors")!,
        .paper: UIImage(named: "PaperCoversRock")!,
        .scissors: UIImage(named: "ScissorsCutPaper")!,
        nil: UIImage(named: "itsATie")!
    ]
    
    let verbs: [Move?: String] = [
        .rock: "crushes",
        .paper: "covers",
        .scissors: "cut"
    ]
    
    // MARK: Outlets
    
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var playerMoveImageView: UIImageView!
    @IBOutlet var opponentMoveImageView: UIImageView!
    @IBOutlet var resultImageView: UIImageView!
    @IBOutlet var resultDescription: UILabel!
    
    // MARK: Outlets To Animate
    
    @IBOutlet var movesContainer: UIStackView!
    @IBOutlet var resultContainer: UIStackView!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: Actions
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Life Cycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let match = self.match {
            
            // Set the result title.
            if let winner = match.winner {
                resultTitle.text = winner == match.playerMove ? "You Win!" : "You Lose!"
            } else {
                resultTitle.text = "Draw!"
            }
            
            // Set the move image views.
            playerMoveImageView.image = match.playerMove.image
            opponentMoveImageView.image = match.opponentMove.image
            
            // Set the result image view and description.
            resultImageView.image = resultImages[match.winner]
            resultDescription.text = match.winner != nil
                ? "\(match.winner!.rawValue.capitalized) \(verbs[match.winner]!) \(match.loser!.rawValue)!"
                : "At least you got a match!"
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
