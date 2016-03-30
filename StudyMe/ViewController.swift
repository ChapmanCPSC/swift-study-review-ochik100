//
//  ViewController.swift
//  StudyMe
//
//  Created by Kelly Ochikubo on 3/29/16.
//  Copyright © 2016 Kelly Ochikubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var conceptLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    var timer : NSTimer? = NSTimer()
    var counter = 30
    var index = 0
    var first = true
    var concepts : [String] = ["Let v.s. Var", "Computed Initializers", "Computed Variables", "Setter Observers",
                               "Functions", "External Parameters", "Default Parameters", "Anonymous Functions",
                               "Optional Chaining", "Failable Initializers", "Casting", "Class Methods", "Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding", "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "GAME OVER"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countdownLabel.text = String(counter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButton(sender: AnyObject) {
        if timer != nil {
            return
        }
        if first == false {
            return
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        conceptLabel.text = concepts[index]
        first = false
    }

    @IBAction func nextButton(sender: AnyObject) {
        counter = 30
        first = true
        if timer != nil {
            countdownLabel.text = String(counter)
            index += 1
            conceptLabel.text = concepts[index]
        }
        if index == 23 {
            index = 0
            countdownLabel.text = "Press play to start over."
            timer?.invalidate()
            timer = nil
        }
    }
    
    func updateCounter() {
        counter -= 1
        countdownLabel.text = String(counter)
        if counter <= 0 {
            countdownLabel.text = "TIME'S UP!"
            first = true
        }
    }
}

