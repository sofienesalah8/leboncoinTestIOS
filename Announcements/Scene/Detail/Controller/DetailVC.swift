//
//  DetailVC.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import UIKit

class DetailVC: UIViewController {

    private var announcement: Announcement
    private var detailView: DetailView!
    private var viewModel: CategorieListViewModel!

    init(announcement: Announcement) {
        self.announcement = announcement
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = getCategorieViewModel()
        self.initViewController()
    }

    //set categorie viewmodel
    private func getCategorieViewModel() -> CategorieListViewModel {
        let networkLayer = Networking()
        let providing = CategoriesProvider(network: networkLayer)
        return CategorieListViewModel(service: providing)
    }
    
    private func initViewController(){
        //attach the detailView
        self.detailView = DetailView(frame: CGRect.zero)
        self.detailView.setNeedsLayout()
        self.view.backgroundColor = .white
        self.view.addSubview(detailView)
        
        //Configure the action of close button
        self.detailView.btnClose.addTarget(self, action: #selector(btnCloseTapped), for: .touchUpInside)
        
        //binding Data from announcement
        bindingData()
    }
    
    //Biding data from Announcement
    private func bindingData()
    {
        //set image contain
        if let imagePath = announcement.images_url.small {
            ImageLoader.sharedLoader.imageForUrl(urlString: imagePath, completionHandler:{[weak self](image: UIImage?, url: String) in
                self?.detailView.imageDetail.image = image
            })
        }
        else
        {
            self.detailView.imageDetail.image = UIImage(named: "placeholder")
        }
        
        //set title label
        self.detailView.titleLabel.text = announcement.title
        
        //set price label
        self.detailView.priceLabel.text = "\(String(announcement.price))  €"
        
        //set date label
        self.detailView.dateLabel.text = announcement.creation_date.string()
        
        //set categorie label
        self.getCategorieViewModel().getCategorieName(by: announcement.category_id) {[weak self](string) in
             DispatchQueue.main.async {
                self?.detailView.categorieLabel.text = string
            }
        }
       
        //set urgent label
        if (announcement.is_urgent){
            self.detailView.urgentLabel.text = "OUI"
        }else{
             self.detailView.urgentLabel.text = "NON"
        }
       
        //set description label
        self.detailView.descriptionLabel.text = announcement.description
    }
    
    @objc func btnCloseTapped(){
        self.dismiss(animated: true)
    }
}
