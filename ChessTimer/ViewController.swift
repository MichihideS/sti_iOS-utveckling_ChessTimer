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
    var timeWhite = 300
    var timeBlack = 300
    
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
        
        
        timeWhite = 300
        timeBlack = 300
        whitetTime.text = "\(timeFormat(timeWhite))"
        blackTime.text = "\(timeFormat(timeBlack))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func onTimerTick(count: Timer) {
        if isWhiteTurn {
            if timeWhite != 0 {
                timeWhite -= 1
                whitetTime.text = "\(timeFormat(timeWhite))"
            }
        } else {
            if timeBlack != 0 {
                timeBlack -= 1
                blackTime.text = "\(timeFormat(timeBlack))"
            }
        }
        
    }
    
    func timeFormat(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        // let hours: Int = totalSeconds / 3600
        return String(format: "%2d:%02d", minutes, seconds)
    }
}
