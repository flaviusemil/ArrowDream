//
//  ViewController.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 07/11/2016.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

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
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    func buttonClicked() {
        let view = MainController()
        self.present(view, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLogo()
        setupGoogleSignIn()
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.frame = CGRect(x: view.frame.midX - 50, y: view.frame.maxY - 100 - 80, width: 100, height: 40)
        
        view.addSubview(button)
        
        let topColor = UIColor(red: 236 / 255, green: 31 / 255, blue: 31 / 255)
        let bottomColor = UIColor(red: 101 / 255, green: 0, blue: 0)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.backgroundColor = .clear
        
        view.layer.insertSublayer(gradient, at: 0)
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        view.insertSubview(blurEffectView, at: 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            print("There was an error! ", error)
            return
        }
        
        print("Logged in!")
    }
    
    func setupLogo() {
        view.addSubview(logoIV)
        
        logoIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoIV.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        
        view.addConstraintsWithFormat(format: "H:[v0]", views: logoIV)
        view.addConstraintsWithFormat(format: "V:[v0(200)]", views: logoIV)
        
    }

    func setupGoogleSignIn() {
        let googleSignin = GIDSignInButton()
        
        googleSignin.frame = CGRect(x: view.frame.midX - 25, y: view.frame.midY, width: 50, height: 50)
        googleSignin.style = .iconOnly
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        view.addSubview(googleSignin)
    }

}

