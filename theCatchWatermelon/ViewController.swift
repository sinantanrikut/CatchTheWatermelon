//
//  ViewController.swift
//  theCatchWatermelon
//
//  Created by Sinan Tanrıkut on 3.04.2022.
//

import UIKit

class ViewController: UIViewController {

    
    //Variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var waterMelonArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScooreLbl: UILabel!
    
    @IBOutlet weak var melon1: UIImageView!
    
    @IBOutlet weak var melon3: UIImageView!
    @IBOutlet weak var melon2: UIImageView!
    
    @IBOutlet weak var melon4: UIImageView!
    @IBOutlet weak var melon5: UIImageView!
    
    @IBOutlet weak var melon6: UIImageView!
    
    @IBOutlet weak var melon7: UIImageView!
    @IBOutlet weak var melon8: UIImageView!
    @IBOutlet weak var melon9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        
        //Highscore kontrol
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScooreLbl.text = "High Score: \(highScore)"
        }
        if let newScore = storedHighScore as? Int{
            highScore = newScore
            highScooreLbl.text = "High Score: \(highScore)"
        }
        
        
        //Images
        melon1.isUserInteractionEnabled = true
        melon2.isUserInteractionEnabled = true
        melon3.isUserInteractionEnabled = true
        melon4.isUserInteractionEnabled = true
        melon5.isUserInteractionEnabled = true
        melon6.isUserInteractionEnabled = true
        melon7.isUserInteractionEnabled = true
        melon8.isUserInteractionEnabled = true
        melon9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
     
        
        melon1.addGestureRecognizer(recognizer1)
        melon2.addGestureRecognizer(recognizer2)
        melon3.addGestureRecognizer(recognizer3)
        melon4.addGestureRecognizer(recognizer4)
        melon5.addGestureRecognizer(recognizer5)
        melon6.addGestureRecognizer(recognizer6)
        melon7.addGestureRecognizer(recognizer7)
        melon8.addGestureRecognizer(recognizer8)
        melon9.addGestureRecognizer(recognizer9)
        
        waterMelonArray = [melon1,melon2,melon3,melon4,melon5,melon6,melon7,melon8,melon9]
        
        
        //Timers
        
        counter = 10
        timeLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideMelon), userInfo: nil, repeats: true)
       hideMelon()
        
        
        
    }

    @objc func hideMelon(){
        
        for melon in waterMelonArray {
            melon.isHidden = true
        }
        
        
        // random sayı
       let random = Int( arc4random_uniform(UInt32(waterMelonArray.count - 1)))
        waterMelonArray[random].isHidden = false
        
    }
    
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    @objc func countDown(){
        
        counter -= 1
        timeLabel.text = String(counter)
        
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            for melon in waterMelonArray {
                melon.isHidden = true
            }
            
            //High Score
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScooreLbl.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            
            
            //Alert
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to again", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideMelon), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    

}

