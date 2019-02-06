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
            scatter()
            shouldScramble = false
        } else if shouldScramble == false {
            gather()
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
        lambdaLogoImageView.image = lambdaLogo
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
    
    func scatter() {
        
        UIView.animate(withDuration: 2) {
            
            for label in self.labels {
                let minX = self.view.frame.origin.x - label.frame.origin.x
                let maxX = self.view.frame.maxX - label.frame.origin.x
                var t = CGAffineTransform.identity
                t = t.translatedBy(x: CGFloat.random(in: minX...maxX), y: (CGFloat.random(in: 0...self.view.frame.maxY)))
                t = t.scaledBy(x: 1.5, y: 1.5)
                t = t.rotated(by: CGFloat.pi)
                label.transform = t
                label.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: 1)
                label.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: 1)
            }
            
            self.lambdaLogoImageView.alpha = 0
            
        }
        
    }
    
    func gather() {
        
        UIView.animate(withDuration: 2) {
            for label in self.labels {
                label.transform = CGAffineTransform.identity
                label.backgroundColor = .clear
                label.textColor = .black
            }
            self.lambdaLogoImageView.alpha = 1
        }
        
    }
    
    var shouldScramble: Bool = true
    var labels: [UILabel] = []
    let lambda = "Lambda"
    let lambdaLogoImageView = UIImageView()
    
}

