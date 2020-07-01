//
//  ViewController.swift
//  iOS-cw5-p2(XO)
//
//  Created by laila al mutawa on 6/27/20.
//  Copyright © 2020 ljmutawa. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var themeButton: UIButton!
    
    @IBOutlet weak var muteButton: UIButton!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var nextRoundLabel: UIButton!
    
    @IBOutlet weak var resetButtonLabel: UIButton!
    
    @IBOutlet weak var xWinnerCountLabel: UILabel!
    @IBOutlet weak var oWinnerCountLabel: UILabel!
    @IBOutlet weak var xCounter: UILabel!
    @IBOutlet weak var oCounter: UILabel!
    
    
    
    var punch1: AVAudioPlayer?
    var punch2: AVAudioPlayer?
    var winnersApplause: AVAudioPlayer?
    
    func applause() {
        let path = Bundle.main.path(forResource: "applause.m4a", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            winnersApplause = try AVAudioPlayer(contentsOf: url)
            winnersApplause?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func punchSound1() {
        let path = Bundle.main.path(forResource: "punchSoundEffect1.m4a", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            punch1 = try AVAudioPlayer(contentsOf: url)
            punch1?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func punchSound2() {
        let path = Bundle.main.path(forResource: "punchSoundEffect2.m4a", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            punch2 = try AVAudioPlayer(contentsOf: url)
            punch2?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.b1.layer.cornerRadius = 10
        self.b2.layer.cornerRadius = 10
        self.b3.layer.cornerRadius = 10
        self.b4.layer.cornerRadius = 10
        self.b5.layer.cornerRadius = 10
        self.b6.layer.cornerRadius = 10
        self.b7.layer.cornerRadius = 10
        self.b8.layer.cornerRadius = 10
        self.b9.layer.cornerRadius = 10
        
        self.nextRoundLabel.layer.cornerRadius = 7
        
        self.themeButton.layer.cornerRadius = 10
        self.muteButton.layer.cornerRadius = 10
        
        xWinnerCountLabel.layer.backgroundColor  = #colorLiteral(red: 0.902330637, green: 0.43937549, blue: 0.3217788339, alpha: 1)
        xWinnerCountLabel.layer.cornerRadius = 5
        xWinnerCountLabel.layer.masksToBounds = true
        
        oWinnerCountLabel.layer.backgroundColor  = #colorLiteral(red: 0.8717752099, green: 0.7208406329, blue: 0.3230470717, alpha: 1)
        oWinnerCountLabel.layer.cornerRadius = 5
        oWinnerCountLabel.layer.masksToBounds = true
        
        xWinnerCountLabel.layer.backgroundColor  = #colorLiteral(red: 0.902330637, green: 0.43937549, blue: 0.3217788339, alpha: 1)
        xWinnerCountLabel.layer.cornerRadius = 5
        xWinnerCountLabel.layer.masksToBounds = true
        
        xCounter.layer.backgroundColor  = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.4)
        xCounter.layer.cornerRadius = 5
        xCounter.layer.masksToBounds = true

        oCounter.layer.backgroundColor  = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.4)
        oCounter.layer.cornerRadius = 5
        oCounter.layer.masksToBounds = true
    }
    
    var turnCount = 0
    var round = 1
    var nextRound = false
    var isMute = false
    var xWins = 0
    var oWins = 0
    var currentTheme : Theme = Theme.theme4
    let themes : [Theme] = [.theme1, .theme2, .theme3, .theme4]
    
    @IBAction func changeTheme(_ sender: Any) {
        if turnCount == 0 {
            currentTheme = themes.randomElement()!
            view.backgroundColor = currentTheme.backgroundColor
            nextRoundLabel.backgroundColor = currentTheme.nextRoundColor
            roundLabel.textColor = currentTheme.textColor
            turnLabel.textColor = currentTheme.textColor
            xWinnerCountLabel.backgroundColor = currentTheme.xButtonColor
            oWinnerCountLabel.backgroundColor = currentTheme.oButtonColor
            xWinnerCountLabel.textColor = currentTheme.oButtonColor
            oWinnerCountLabel.textColor = currentTheme.xButtonColor
            resetButtonLabel.setTitleColor(currentTheme.textColor, for: .normal)
            nextRoundLabel.setTitleColor(currentTheme.nextRoundTextColor, for: .normal)
        }
    }
    
    var clicksOnTheMuteButton = 0
    @IBAction func muteSounds(_ sender: Any) {
        clicksOnTheMuteButton += 1
        if clicksOnTheMuteButton % 2 != 0 {
            isMute = true
        } else {
            isMute = false
        }
        if isMute == true {
            muteButton.setTitle("🔇", for: .normal)
        } else {
            muteButton.setTitle("🔈", for: .normal)
        }
    }
    
    @IBAction func tap(_ sender: UIButton) {
    
        if turnCount % 2 == 0 {
            if isMute == false {
            punchSound1()
            }
            sender.setTitle("X", for: .normal)
            turnLabel.text = "O Turn"
            sender.backgroundColor = currentTheme.xButtonColor
            sender.setTitleColor(currentTheme.oButtonColor, for: .normal)
        } else {
            if isMute == false {
            punchSound2()
            }
            sender.setTitle("O", for: .normal)
            turnLabel.text = "X Turn"
            sender.backgroundColor = currentTheme.oButtonColor
            sender.setTitleColor(currentTheme.xButtonColor, for: .normal)
        }
        sender.isUserInteractionEnabled = false
        vibrate()
        
        if checkWinner(p: "X") {
            okAlert(title: "🎉CONGRAATS X, YOU WIN🎉", message: "Click on Next Round to play again!")
            xWins += 1
            xCounter.text = "\(xWins)"
            nextRound = true
            makesButtonsUserUninteractive()
            
        } else if checkWinner(p: "O"){
            okAlert(title: "🎉CONGRAATS O, YOU WIN🎉", message: "Click on Next Round to play again!")
            oWins += 1
            oCounter.text = "\(oWins)"
            nextRound = true
            makesButtonsUserUninteractive()
            
        }else if turnCount == 8 {
            okAlert(title: "YOU'RE TOO GOOD,              IT'S A TIE!!", message: "Click on Next Round to play again!")
            nextRound = true
        }
        print(turnCount)
        turnCount += 1
    }
    
    func checkWinner(p: String) -> Bool {
        let f1 = b1.titleLabel?.text
        let f2 = b2.titleLabel?.text
        let f3 = b3.titleLabel?.text
        let f4 = b4.titleLabel?.text
        let f5 = b5.titleLabel?.text
        let f6 = b6.titleLabel?.text
        let f7 = b7.titleLabel?.text
        let f8 = b8.titleLabel?.text
        let f9 = b9.titleLabel?.text
        
        let r1 = (f1, f2, f3) == (p, p, p)
        let r2 = (f4, f5, f6) == (p, p, p)
        let r3 = (f7, f8, f9) == (p, p, p)
        let c1 = (f1, f4, f7) == (p, p, p)
        let c2 = (f2, f5, f8) == (p, p, p)
        let c3 = (f3, f6, f9) == (p, p, p)
        let d1 = (f1, f5, f9) == (p, p, p)
        let d2 = (f3, f5, f7) == (p, p, p)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            print("WE HAVE A WINNER!!!")
            if isMute == false {
                applause()
            }
            return true
        } else {
            return false
        }
    }
    
    
    @IBAction func nextRoundButton(_ sender: Any) {
        if nextRound == true {
            resetGame()
            
            round += 1
            roundLabel.text = "Round \(round)"
            nextRound = false
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        resetGame()
        round = 1
        roundLabel.text = "Round \(round)"
        
        xWins = 0
        xCounter.text = "\(xWins)"
        oWins = 0
        oCounter.text = "\(oWins)"
    }
    
    func resetGame() {
        
        turnCount = 0
        turnLabel.text = "X Turn"
        
        b1.titleLabel?.text = nil
        b2.titleLabel?.text = nil
        b3.titleLabel?.text = nil
        b4.titleLabel?.text = nil
        b5.titleLabel?.text = nil
        b6.titleLabel?.text = nil
        b7.titleLabel?.text = nil
        b8.titleLabel?.text = nil
        b9.titleLabel?.text = nil
        
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        b4.setTitle("", for: .normal)
        b5.setTitle("", for: .normal)
        b6.setTitle("", for: .normal)
        b7.setTitle("", for: .normal)
        b8.setTitle("", for: .normal)
        b9.setTitle("", for: .normal)
        
        makesButtonsUserInteractive()
        
        b1.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b2.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b3.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b4.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b5.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b6.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b7.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b8.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
        b9.backgroundColor = #colorLiteral(red: 0.6665927172, green: 0.6667093635, blue: 0.666585207, alpha: 0.4)
    }
    
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    func makesButtonsUserInteractive() {
        b1.isUserInteractionEnabled = true
        b2.isUserInteractionEnabled = true
        b3.isUserInteractionEnabled = true
        b4.isUserInteractionEnabled = true
        b5.isUserInteractionEnabled = true
        b6.isUserInteractionEnabled = true
        b7.isUserInteractionEnabled = true
        b8.isUserInteractionEnabled = true
        b9.isUserInteractionEnabled = true
    }
    
    func makesButtonsUserUninteractive() {
        b1.isUserInteractionEnabled = false
        b2.isUserInteractionEnabled = false
        b3.isUserInteractionEnabled = false
        b4.isUserInteractionEnabled = false
        b5.isUserInteractionEnabled = false
        b6.isUserInteractionEnabled = false
        b7.isUserInteractionEnabled = false
        b8.isUserInteractionEnabled = false
        b9.isUserInteractionEnabled = false
    }
    
}

func vibrate() {
    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
}
