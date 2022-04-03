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
        
        
        //Timers
        
        counter = 30
        timeLabel.text
        
    }

    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    

}

