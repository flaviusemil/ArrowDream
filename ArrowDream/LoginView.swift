//
//  LoginView.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 09/11/2016.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackground()
    }
    
    func setupBackground() {
        let topColor = UIColor(red: 236 / 255, green: 31 / 255, blue: 31 / 255)
        let bottomColor = UIColor(red: 101 / 255, green: 0, blue: 0)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        backgroundColor = .clear
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
