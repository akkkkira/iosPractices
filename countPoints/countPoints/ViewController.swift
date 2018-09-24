//
//  ViewController.swift
//  countPoints
//
//  Created by 笠井瑛 on 2018/09/24.
//  Copyright © 2018年 笠井瑛. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var minusGetter: UITextField!
    
    @IBOutlet weak var showPoints: UILabel!
    
    var num:Int = 0
    var numOrigin:Int = 0
    var minusPoints:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textField = UITextField()
        
        textField.delegate = self
        textField.placeholder = "points"
        textField.resignFirstResponder()
        
        numOrigin = defaults.integer(forKey: "Points")
        showPoints.text = String(numOrigin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateCounter(num : Int){
        defaults.set(numOrigin + num, forKey: "Points")

        showPoints.text = String(defaults.integer(forKey: "Points"))
    }
    
    @IBAction func plus1Point(_ sender: Any) {
        num += 1
        updateCounter(num: num)
    }
    
    @IBAction func plus3Points(_ sender: Any) {
        num += 3
        updateCounter(num: num)
    }
    
    @IBAction func plus5Points(_ sender: Any) {
        num += 5
        updateCounter(num: num)
    }
    
   
    @IBAction func minusPoints(_ sender: Any) {
        minusPoints = minusGetter.text!
        num -= Int(minusPoints)!
        updateCounter(num: num)
    }
}

