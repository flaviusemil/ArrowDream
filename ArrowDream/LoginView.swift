//
//  LoginView.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 09/11/2016.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class LoginView: UIView, GIDSignInUIDelegate {
    
    let logoIV: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = #imageLiteral(resourceName: "logo");
        iv.contentMode = .scaleAspectFit
        
        return iv;
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        let target = LoginController()
        button.addTarget(target, action: #selector(target.buttonClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var customButton: CustomButton = {
        let button = CustomButton(frame: CGRect.zero, type: .iconOnly)
        let iv = UIImageView(frame: CGRect.zero)
        let widthImage: CGFloat = 28
        let heigthImage: CGFloat = 28
        iv.image = #imageLiteral(resourceName: "googleButtonLogo")
        iv.contentMode = .scaleAspectFit
        iv.frame = CGRect(x: button.frame.origin.x + ((button.frame.width - 8 - widthImage + 1 - 2) / 2), y: button.frame.origin.y + ((button.frame.width - 8 - heigthImage + 1 + 1) / 2), width: widthImage, height: heigthImage)
        button.addSubview(iv)
        button.layer.cornerRadius = 2
        button.backgroundColor = .white
        button.frame = CGRect(x: self.frame.midX - 48 - 48 - 10, y: self.frame.midY + 4, width: 40, height: 40)
        button.imageView?.contentMode = .scaleAspectFit
        
        let target = LoginController()
        button.addTarget(target, action: #selector(target.touchDown), for: .touchDown)
        button.addTarget(target, action: #selector(target.touchUp), for: .touchUpInside)
        button.addTarget(target, action: #selector(target.touchUp), for: .touchUpOutside)
        return button
    }()
    
    /** INIT FUNCTION | CURENTLY NOT WORKING! **/
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setup() {
        setupBackground()
        setupLogo()
        setupLoginButton()
        setupFacebookButton()
        setupGoogleButton()
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
    
    func getButton() -> CustomButton {
        return customButton
    }
    
    func setupLogo() {
        addSubview(logoIV)
        
        logoIV.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoIV.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150).isActive = true
        
        addConstraintsWithFormat(format: "H:[v0]", views: logoIV)
        addConstraintsWithFormat(format: "V:[v0(200)]", views: logoIV)
        
    }
    
    func setupFacebookButton() {
        let button = FBSDKLoginButton()
        button.frame = CGRect(x: frame.midX + 4, y: frame.midY + 4, width: 40, height: 40)
        addSubview(button)
    }
    
    let googleSignin = GIDSignInButton()
    
    func setupGoogleButton() {
        googleSignin.frame = CGRect(x: frame.midX - 48 - 10, y: frame.midY, width: 48, height: 48)
        googleSignin.style = .iconOnly
        
        addSubview(googleSignin)
    }
    
    func setupLoginButton() {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.frame = CGRect(x: frame.midX - 50, y: frame.maxY - 100 - 80, width: 80, height: 40)
        
        addSubview(button)
        addSubview(customButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
