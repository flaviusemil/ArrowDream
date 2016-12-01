//
//  Extensions.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 11/9/16.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIColor {
    convenience init(red r: CGFloat, green g: CGFloat, blue b: CGFloat) {
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
    
    static func rgb(red r: CGFloat, green g: CGFloat, blue b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
