//
//  AnnouncementListingView.swift
//  Announcements
//
//  Created by Sofiene Salah on 11/10/2021.
//

import UIKit

class AnnouncementListingView: UIView {
    
    // the container view
    let container: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    // the bar barview contains logo+ categories bar
    let barView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.CustomColor.principalColor
        view.layer.masksToBounds = true
        return view
    }()
    
    // the logo
    let logoImage: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    // the logo
    let btnCategorie: ButtonWithImage = {
        var button = ButtonWithImage(type: .custom)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "categorie"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Catégories", for: .normal)
        
        return button
    }()
    
    //Main Tableview
    let tableView: UITableView = {
        var tableview = UITableView()
        tableview.layer.masksToBounds = true
        tableview.separatorStyle = .none
        return tableview
    }()
    
    // init function ******************
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    // required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //apply when the view is added
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAllObjects()
        setupAllConstraint()
    }
    
    // to attach all objects to the main view
    private func setupAllObjects()
    {
        self.superview?.addSubview(container)
        container.addSubview(barView)
        barView.addSubview(logoImage)
        barView.addSubview(btnCategorie)
        container.addSubview(tableView)
    }
    
    //to setup constraints of all objects
    private func setupAllConstraint(){
        
        // Container constraints
        container.anchor(top: self.superview?.topAnchor, left: self.superview?.leftAnchor, bottom: self.superview?.bottomAnchor , right: self.superview?.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        // Bar View constraints
        barView.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 120, enableInsets: false)
        
        // image logo constraints
        logoImage.anchor(top: barView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: barView.centerXAnchor, centerY: nil, width: 200, height: 50, enableInsets: false)
        
        // button categorie constraints
        btnCategorie.anchor(top: nil, left: barView.leftAnchor, bottom: barView.bottomAnchor, right: barView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, centerX: nil, centerY: nil, width: 0, height: 35, enableInsets: true)
        
        // tableview categorie constraints
        tableView.anchor(top: barView.bottomAnchor, left: barView.leftAnchor, bottom: self.superview?.bottomAnchor, right: barView.rightAnchor, paddingTop: -20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: true)
    }
    
}
