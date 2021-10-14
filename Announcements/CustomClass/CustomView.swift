//
//  CustomView.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

class CustomView: UIView {
    
    private var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            self.backgroundColor = UIColor.white
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 5).cgPath
            self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            self.layer.shadowOpacity = 0.75
            self.layer.shadowRadius = 2
            self.layer.masksToBounds = true
            self.clipsToBounds = false
        }
    }
}
