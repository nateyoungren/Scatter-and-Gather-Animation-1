//
//  ViewController.swift
//  ScatterGather
//
//  Created by Nathanael Youngren on 2/6/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func toggle(_ sender: UIBarButtonItem) {
        
        if shouldScramble == true {
            shouldScramble = false
        } else if shouldScramble == false {
            shouldScramble = true
        }
        
    }
    
    var shouldScramble: Bool = true
    
}

