//
//  ButtonWithImage.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

//custom class of UIButton to perform change on layout, to reuse also
class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 50), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 60)
        }
    }
}
