//
//  AnnouncementListVC.swift
//  Announcements
//
//  Created by sofiene on 11/10/2021.
//

import UIKit

class AnnouncementListVC: UIViewController {
    
    private let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    private var viewModelA: AnnouncementsViewModel!
    private var viewModelC: CategorieListViewModel!
    private var arrayAnnouncements: [Announcement] = []
    private var announcementView: AnnouncementListingView!
    var selectCategorie: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelA = getViewModelA()
        viewModelC = getViewModelC()
        self.initViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (selectCategorie != 0)
        {
            viewModelC.getCategorieName(by: selectCategorie) {[weak self](string) in
                DispatchQueue.main.async {
                    self?.announcementView.btnCategorie.setTitle(string, for: .normal)
                }
            }
        }else{
            self.announcementView.btnCategorie.setTitle(NSLocalizedString("Toutes les catégories", comment: "Toutes les catégories string"), for: .normal)
        }
        fetchByCategorie(selectCategorie)
    }
    
    private func initViewController(){
        //attach the AnnouncementView
        announcementView = AnnouncementListingView(frame: CGRect.zero)
        self.view.backgroundColor = .white
        self.view.addSubview(announcementView)
        
        //Configure the action of Categorie button
        announcementView.btnCategorie.addTarget(self, action: #selector(showCategorieList), for: .touchUpInside)
        
        //tableview configuration
        announcementView.tableView.dataSource = self
        announcementView.tableView.delegate = self
        announcementView.tableView.register(AnnouncementTableViewCell.self, forCellReuseIdentifier: "announcementCell")
        
        //indicator View
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = self.view.center
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = true
    }
    
    //set viewModel
    private func getViewModelA() -> AnnouncementsViewModel {
        let networkLayer = Networking()
        let providing = AnnoucementsProvider(network: networkLayer)
        return AnnouncementsViewModel(service: providing)
    }

    //get cateogorie ViewModel
    private func getViewModelC() -> CategorieListViewModel {
        let networkLayer = Networking()
        let providing = CategoriesProvider(network: networkLayer)
        return CategorieListViewModel(service: providing)
    }
    
    //fetch by categorie
    private func fetchByCategorie(_ by: Int)
    {
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        viewModelA.fetchByCategorie(cat: by) { [weak self] result in
            switch result
            {
            case .success(let announces):
            self?.arrayAnnouncements = announces
            DispatchQueue.main.async {
                self?.announcementView.tableView.reloadData()
                self?.myActivityIndicator.stopAnimating()
            }
            case .failure( _):
                //j'ai pas eu le temps d'implementer les cas d'erreurs
                print("erreur")
            }
            
        }
    }
    
    //show detail interface
    private func showdetail(index: Int){
        self.modalPresentationStyle = .fullScreen
        let announcement = arrayAnnouncements[index]
        let viewController = DetailVC(announcement: announcement)
        self.present(viewController, animated: true)
    }
    
    // show categorie list interface
    @objc private func showCategorieList(){
        self.modalPresentationStyle = .fullScreen
        let viewController: UIViewController = CategorieListVC()
        self.present(viewController, animated: true)
        
    }
}

// manage taleview delegate
extension AnnouncementListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayAnnouncements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell", for: indexPath) as! AnnouncementTableViewCell
        let announcement = self.arrayAnnouncements[indexPath.row]
        
        cell.titleLabel.text = announcement.title
        
        if let imagePath = announcement.images_url.small {
            ImageLoader.sharedLoader.imageForUrl(urlString: imagePath, completionHandler:{[weak cell](image: UIImage?, url: String) in
                cell?.imageCell.image = image
            })
        }
        else
        {
            cell.imageCell.image = UIImage(named: "placeholder")
        }
        
        cell.priceLabel.text = "\(String(announcement.price))  €"
        
        viewModelC.getCategorieName(by: announcement.category_id) {[weak cell](string) in
            DispatchQueue.main.async {
                cell?.categorieLabel.text = string
            }
        }
        
        cell.dateLabel.text = announcement.creation_date.string()
        
        if (announcement.is_urgent)
        {
            cell.iconUrgent.isHidden = false
        }else
        {
            cell.iconUrgent.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showdetail(index: indexPath.row)
    }
}

