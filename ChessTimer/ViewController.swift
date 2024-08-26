//
//  ViewController.swift
//  ChessTimer
//
//  Created by Michihide Sugito on 2024-08-22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var whitetTime: UILabel!
    @IBOutlet weak var blackTime: UILabel!
    @IBOutlet weak var playButtonTest: UIButton!
    
    var isNotWhite = false
    var timeWhite = 300.0
    var timeBlack = 300.0
    
    let timeFormatter = DateComponentsFormatter()
    var count: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeFormatter.allowedUnits = [.minute, .second]
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        sender.setTitle("Switch", for: .normal)
        
        count?.invalidate()
        
        if isNotWhite {
            isNotWhite = false
        } else {
            isNotWhite = true
        }
        
        count = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: onTimerTick(count:))
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        count?.invalidate()
        
        timeWhite = 300.0
        timeBlack = 300.0
        whitetTime.text = timeFormatter.string(from: timeWhite)
        blackTime.text = timeFormatter.string(from: timeBlack)
        isNotWhite = true
        playButtonTest.setTitle("Play", for: .normal)
    }
    
    func onTimerTick(count: Timer) {
        if isNotWhite {
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
