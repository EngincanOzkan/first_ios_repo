//
//  ViewController.swift
//  Bullseye
//
//  Created by Engincan Özkan on 6.09.2017.
//  Copyright © 2017 Engincan Özkan. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var ExactSwitch: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var counter: Int = 0
    var randomNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CreateRandomNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CreateRandomNumber(){
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move to slider to \(randomNumber)"
    }
    
    @IBAction func CheckValue(_ sender: Any) {
       
        if ExactSwitch.isOn{
        
            if randomNumber == Int(numSlider.value){
                resultLabel.text = "You were right on point! Bullseye!"
                resultLabel.backgroundColor = UIColor.green
            }else {
                resultLabel.text = "whooops! You missed! Try later"
                 resultLabel.backgroundColor = UIColor.red
            }
            
        }else {
            
            if randomNumber+3 >= Int(numSlider.value) && randomNumber-3 <= Int(numSlider.value){
                resultLabel.text = "You were right on point! Bullseye!"
                 resultLabel.backgroundColor = UIColor.green
            }else {
                resultLabel.text = "whooops! You missed! Try later"
                 resultLabel.backgroundColor = UIColor.red
            }
            
        }
        
        resultLabel.isHidden = false
        playAgainButton.isHidden = false;
        
    }
    
    @IBAction func PlayAgain(_ sender: Any) {
        
        numSlider.setValue(50.0, animated: false)
        CreateRandomNumber()
        resultLabel.isHidden = true
        playAgainButton.isHidden = true;
    }
    
    @IBAction func SliderValueChanged(_ sender: Any) {
        
    }
    
    
}

