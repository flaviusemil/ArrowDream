//
//  MainController.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 11/11/2016.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go back to Login", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    func buttonClicked() {
        let view = LoginController()
        self.present(view, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        button.frame = CGRect(x: view.frame.midX - 75, y: view.frame.midY, width: 150, height: 50)
        view.addSubview(button)
    }
}
