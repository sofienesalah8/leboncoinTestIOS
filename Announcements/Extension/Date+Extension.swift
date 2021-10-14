//
//  Date+Extension.swift
//  Announcements
//
//  Created by sofiene on 10/10/2021.
//

import UIKit

extension Date{
    func string(withFormat format: String = "dd/MM/yyyy HH:mm", withLocale locale:Locale = Locale.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
