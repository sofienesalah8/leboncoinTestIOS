//
//  CategorieListingView.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import UIKit

class CategorietListingView: UIView {
    
    // the containerview
    let container: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    // the barview contains close button
    let barView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.CustomColor.principalColor
        view.layer.masksToBounds = true
        return view
    }()
    
    //close button
    let btnClose: UIButton = {
        var button = UIButton()
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    //title label
    let titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    //Main Tableview
    let tableView: UITableView = {
        var tableview = UITableView()
        tableview.layer.masksToBounds = true
        return tableview
    }()
    
    //apply when the view is added
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAllObjects()
        setupAllConstraint()
    }
    
    // init function ******************
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    // required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // to attach all objects to the main view
    private func setupAllObjects()
    {
        self.superview?.addSubview(container)
        container.addSubview(barView)
        container.addSubview(btnClose)
        container.addSubview(titleLabel)
        container.addSubview(tableView)
    }
    
    //to setup constraints of all objects
    private func setupAllConstraint(){
        
        // Container constraints
        container.anchor(top: self.superview?.topAnchor, left: self.superview?.leftAnchor, bottom: self.superview?.bottomAnchor , right: self.superview?.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        // Bar View constraints
        barView.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 64, enableInsets: false)
        
        // button Close constraints
        btnClose.anchor(top: nil, left: container.leftAnchor, bottom: barView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, centerX: nil, centerY: nil, width: 30, height: 30, enableInsets: false)
        
        //titlelabel
        titleLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: barView.centerXAnchor, centerY: btnClose.centerYAnchor, width: 0, height: 0, enableInsets: false)
        
        //tableview
        tableView.anchor(top: barView.bottomAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: container.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
    }
}
