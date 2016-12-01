//
//  CustomButton.swift
//  ArrowDream
//
//  Created by Flavius Condurache on 11/25/16.
//  Copyright © 2016 Flavius Condurache. All rights reserved.
//

import UIKit

public enum CustomButtonType {
    case normal
    case custom
    case iconOnly
}

class CustomButton: UIButton {
    
    public var width: CGFloat?
    public var height: CGFloat?
    public var icon: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(frame: CGRect, type: CustomButtonType) {
        
        let isNullFrame = frame == CGRect.zero ? true : false
        
        self.width = frame.width
        self.height = frame.height
        
        super.init(frame: frame);
        
        switch type {
        case .iconOnly:
            self.width = 48
            self.height = 48
            if self.icon != nil {
                self.setImage(self.icon, for: .normal)
            }
            break
        case .normal:
            self.width = 100
            self.height = 40
            
        case .custom:
            break
        }
        
        self.frame = CGRect(x: self.bounds.width / 2 - (isNullFrame ? 0 : (self.width! / 2)),
                            y: self.bounds.height / 2 - (isNullFrame ? 0 : (self.height! / 2)),
                            width: self.width!,
                            height: self.height!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
