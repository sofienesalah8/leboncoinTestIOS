//
//  UIScrollView+Extension.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import UIKit

extension UIScrollView{
    func resizeScrollViewContentSize(height: Float) {
        var contentRect = CGRect.zero
        for view in self.superview!.subviews {
            contentRect = contentRect.union(view.frame)
        }
        contentRect.size.height = contentRect.size.height + CGFloat(height)
        self.contentSize = contentRect.size
    }
}
