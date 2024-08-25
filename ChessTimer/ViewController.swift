//
//  ViewController.swift
//  ChessTimer
//
//  Created by Michihide Sugito on 2024-08-22.
//

import UIKit

class ViewController: UIViewController {
    var isWhite = true
    var isBlack = false
    var isWhiteTurn = false
    var isBlackTurn = false
    var timeWhite = 300.0
    var timeBlack = 300.0
    
    let timeFormatter = DateComponentsFormatter()
    var count: Timer!
    
    @IBOutlet weak var whitetTime: UILabel!
    
    @IBOutlet weak var blackTime: UILabel!
    
    
    @IBAction func playButton(_ sender: UIButton) {
        sender.setTitle("Switch", for: .normal)
        
        if count != nil {
            count.invalidate()
        }
        
        if isWhite {
            isWhite = false
            isBlack = true
            isWhiteTurn = true
            isBlackTurn = false
        } else {
            isWhite = true
            isBlack = false
            isWhiteTurn = false
            isBlackTurn = true
        }
        
        count = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: onTimerTick(count:))
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        if count != nil {
            count.invalidate()
        }
        
        timeWhite = 300.0
        timeBlack = 300.0
        whitetTime.text = timeFormatter.string(from: timeWhite)
        blackTime.text = timeFormatter.string(from: timeBlack)
        isWhite = true
        isBlack = false
        isWhiteTurn = false
        isBlackTurn = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeFormatter.allowedUnits = [.minute, .second]
        
    }
    
    func onTimerTick(count: Timer) {
        if isWhiteTurn {
            if timeWhite != 0.0 {
                timeWhite -= 1.0
                whitetTime.text = timeFormatter.string(from: timeWhite)
            }
        } else {
            if timeBlack != 0.0 {
                timeBlack -= 1.0
                blackTime.text = timeFormatter.string(from: timeBlack)
            }
        }
        
    }
}
