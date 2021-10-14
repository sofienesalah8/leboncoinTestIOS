//
//  DetailView.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import UIKit

class DetailView: UIView {
    
    let scrollview: UIScrollView = {
        var scrollview = UIScrollView()
        scrollview.isScrollEnabled = true
        scrollview.alwaysBounceVertical = true
        scrollview.alwaysBounceHorizontal = false
        return scrollview
    }()
    
    //The container view
    let container: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //close button
    let btnClose: UIButton = {
        var button = UIButton()
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    //the image of announcement
    let imageDetail: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .black
        img.clipsToBounds = true
        return img
    }()
    
    //title of announcement
    let titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    //price of announcement
    let priceLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.CustomColor.principalColor
        return label
    }()
    
    //date of announcement
    let dateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //separator
    let separator: UIView = {
        var view = UILabel()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //criteria label
    let criteriaLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.CustomColor.principalColor
        label.text = NSLocalizedString("Critéres", comment: "Critéres string")
        return label
    }()
    
    //stackview contain crietaria fields
    let stackviewCriteria: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading;
        stackView.spacing = 0
        return stackView
    }()
    
    //title categorie
    let titleCLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = NSLocalizedString("CATEGORIE", comment: "CATEGORIE string")
        label.textColor = .gray
        return label
    }()
    
    //Urgent Label
    let titleULabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = NSLocalizedString("URGENT", comment: "URGENT string")
        label.textColor = .gray
        return label
    }()
    
    //stackview contain crietaria fields
    let stackviewFieldC: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading;
        stackView.spacing = 0
        return stackView
    }()
    
    //Categorie
    let categorieLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //Urgent
    let urgentLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    //separator
    let separator2: UIView = {
        var view = UILabel()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //title description
    let titleDescriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = NSLocalizedString("Description", comment: "Description string")
        label.textColor = UIColor.CustomColor.principalColor
        return label
    }()
    
    //description
    let descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
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
    
    func setupAllObjects(){
        self.superview?.addSubview(scrollview)
        scrollview.addSubview(container)
        container.addSubview(imageDetail)
        self.superview?.addSubview(btnClose)
        container.addSubview(titleLabel)
        container.addSubview(priceLabel)
        container.addSubview(dateLabel)
        container.addSubview(separator)
        container.addSubview(criteriaLabel)
        container.addSubview(stackviewCriteria)
        stackviewCriteria.addArrangedSubview(titleCLabel)
        stackviewCriteria.addArrangedSubview(titleULabel)
        container.addSubview(stackviewFieldC)
        stackviewFieldC.addArrangedSubview(categorieLabel)
        stackviewFieldC.addArrangedSubview(urgentLabel)
        container.addSubview(separator2)
        container.addSubview(titleDescriptionLabel)
        scrollview.addSubview(descriptionLabel)
        
    }
    func setupAllConstraint(){
        
        // scrollview constraints
        scrollview.anchor(top: self.superview?.topAnchor, left: self.superview?.leftAnchor, bottom: self.superview?.bottomAnchor , right: self.superview?.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        // Container constraints
        container.anchor(top: scrollview.topAnchor, left: scrollview.leftAnchor, bottom: scrollview.bottomAnchor , right: self.superview?.rightAnchor, paddingTop: -20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        // button close constraints
        btnClose.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: nil, right: nil, paddingTop: 36, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 30, height: 30, enableInsets: false)
        
        // image detail  constraints
        imageDetail.anchor(top: container.topAnchor, left: nil, bottom: nil, right: container.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: container.centerXAnchor, centerY: nil, width: 0, height: 200, enableInsets: false)
        
        //title label constraints
        titleLabel.anchor(top: imageDetail.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //price label constraints
        priceLabel.anchor(top: titleLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //date label constraints
        dateLabel.anchor(top: priceLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //separator constraints
        separator.anchor(top: dateLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0.5, enableInsets: false)
        
        //criteria label constraints
        criteriaLabel.anchor(top: separator.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        
        //stackview criteria constraints
        titleCLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleULabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stackviewCriteria.anchor(top: criteriaLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //stackview fields criteria
        categorieLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        urgentLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stackviewFieldC.anchor(top: stackviewCriteria.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //separator constraints
        separator2.anchor(top: stackviewFieldC.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, centerX: nil, centerY: nil, width: 0, height: 0.5, enableInsets: false)
        
        //title description constraints
        titleDescriptionLabel.anchor(top: separator2.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //description constraints
        descriptionLabel.anchor(top: titleDescriptionLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, centerX: nil, centerY: nil, width: 0, height: 0, enableInsets: false)
        
        //to adapt scrollview contentsize
        scrollview.resizeScrollViewContentSize(height: Float(descriptionLabel.text?.heightForLabel(font: UIFont.systemFont(ofSize: 12), lineHeight: 0, width: self.superview?.frame.size.width ?? 0) ?? 0))
        
    }
    
}
