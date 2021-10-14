//
//  String+Extension.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

extension String{
    func heightForLabel(font: UIFont, lineHeight: CGFloat, width: CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        return label.frame.height
    }
}
