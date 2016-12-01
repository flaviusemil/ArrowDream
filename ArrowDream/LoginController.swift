//
//  ViewController.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 07/11/2016.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    let loginView = LoginView()
    
    func buttonClicked() {
        let view = MainController()
        self.present(view, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGoogleLogin()
        
        loginView.frame = view.frame
        view.addSubview(loginView)
        
        loginView.setup()
    }
    
    func touchDown() {
        loginView.customButton.backgroundColor = UIColor.rgb(red: 238, green: 238, blue: 238)
    }
    
    func touchUp() {
        loginView.customButton.backgroundColor = UIColor.white
    }
    
    func setupGoogleLogin() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
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
        self.buttonClicked()
    }

}

