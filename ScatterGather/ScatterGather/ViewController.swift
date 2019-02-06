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
        setUpViews()
    }

    @IBAction func toggle(_ sender: UIBarButtonItem) {
        
        if shouldScramble == true {
            shouldScramble = false
        } else if shouldScramble == false {
            shouldScramble = true
        }
        
    }
    
    func setUpViews() {
        
        let fullStack = UIStackView()
        fullStack.axis = .vertical
        fullStack.distribution = .fill
        fullStack.spacing = 12
        fullStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fullStack)
        
        let letterStack = UIStackView()
        letterStack.axis = .horizontal
        letterStack.distribution = .equalSpacing
        letterStack.spacing = 8
        letterStack.translatesAutoresizingMaskIntoConstraints = false
        fullStack.addArrangedSubview(letterStack)
        
        for letter in lambda {
            let newLabel = UILabel()
            newLabel.text = String(letter)
            newLabel.font = AppearanceHelper.heroynFont(style: .headline, pointSize: 40)
            newLabel.textAlignment = .center
            labels.append(newLabel)
            letterStack.addArrangedSubview(newLabel)
        }
        
        let lambdaLogo = UIImage(named: "Lambda_Logo_Full")
        let lambdaLogoImageView = UIImageView(image: lambdaLogo)
        lambdaLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        fullStack.addArrangedSubview(lambdaLogoImageView)
        
        NSLayoutConstraint.activate([
            fullStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            fullStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            fullStack.widthAnchor.constraint(equalToConstant: 250),
            lambdaLogoImageView.widthAnchor.constraint(equalTo: fullStack.widthAnchor),
            lambdaLogoImageView.heightAnchor.constraint(equalTo: lambdaLogoImageView.widthAnchor, multiplier: 1/3, constant: 0)
            ])
        
    }
    
    var shouldScramble: Bool = true
    var labels: [UILabel] = []
    let lambda = "Lambda"
    
}

