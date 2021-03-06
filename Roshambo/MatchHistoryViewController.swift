//
//  MatchHistoryViewController.swift
//  Roshambo
//
//  Created by Felipe Ribeiro on 27/10/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class MatchHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    var history: [Match]!

    // MARK: Outlets
    
    @IBOutlet var emptyState: UIStackView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var customNavigationItem: UINavigationItem!
    
    // MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the matches in reverse order.
        history = history.reversed()
        
        // Add the OK button.
        customNavigationItem.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(dismiss(_:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.isHidden = history.isEmpty
        emptyState.isHidden = !history.isEmpty
    }
    
    // MARK: Actions
    
    @objc func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchHistoryTableViewCell") as! MatchHistoryTableViewCell
        let match = history[indexPath.row]
        
        if let winner = match.winner {
            cell.resultTitle.text = winner == match.playerMove ? "You Win!" : "You Lose!"
        } else {
            cell.resultTitle.text = "Draw!"
        }
        
        cell.playerMoveImageView.image = match.playerMove.image
        cell.opponentMoveImageView.image = match.opponentMove.image
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        cell.resultDate.text = "Played at: \(dateFormatter.string(from: match.date))"
        
        return cell
    }
}
