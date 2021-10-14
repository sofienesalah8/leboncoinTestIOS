//
//  UIApplication+Extension.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

// default statusbarStyle, to force the lightContent on status bar
extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor
        } set {
            (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = UIColor.CustomColor.principalColor
        }
    }
}
