//
//  AnnouncementTableViewCell.swift
//  Announcements
//
//  Created by Sofiene Salah on 11/10/2021.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {
    
    //container
    let containerView:CustomView = {
        let view = CustomView()
        return view
    }()
    
    //image cell
    let imageCell:UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .black
        img.clipsToBounds = true
        return img
    }()
    
    //title label
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    //price label
    let priceLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.CustomColor.principalColor
        return label
    }()
    
    //categorie label
    let categorieLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //date label
    let dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //is urgent icon
    let iconUrgent:UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "urgent"))
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        addSubview(containerView)
        containerView.addSubview(imageCell)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(categorieLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(iconUrgent)
        
        //container
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //image cell
        imageCell.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 0, centerX: nil, centerY: nil, width: 120, height: 0, enableInsets: false)
        
        //title label
        titleLabel.anchor(top: topAnchor, left: imageCell.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //price label
        priceLabel.anchor(top: titleLabel.bottomAnchor, left: imageCell.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //date label
        dateLabel.anchor(top: nil, left: imageCell.rightAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 5, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //categorie label
        categorieLabel.anchor(top: nil, left: imageCell.rightAnchor, bottom: dateLabel.topAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 5, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //urgent label
        iconUrgent.anchor(top: nil, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, centerX: nil, centerY: nil, width: 30, height: 30, enableInsets: false)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
