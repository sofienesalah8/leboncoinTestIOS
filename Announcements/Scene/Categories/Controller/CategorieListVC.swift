//
//  CategorieListVC.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import UIKit

class CategorieListVC: UIViewController {
    
    private let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    private var viewModel: CategorieListViewModel!
    private var arrayCategories: [Categorie] = []
    private var categorieView: CategorietListingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = getCategorieViewModel()
        self.initViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchByCategorie()
    }
    
    private func initViewController(){
        
        //attach the view
        categorieView = CategorietListingView(frame: CGRect.zero)
        categorieView.setNeedsLayout()
        self.view.addSubview(categorieView)
        
        //Configure the action of close button
        categorieView.btnClose.addTarget(self, action: #selector(btnCloseTapped), for: .touchUpInside)
        
        //tableview configuration
        categorieView.tableView.dataSource = self
        categorieView.tableView.delegate = self
        categorieView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //title label
        categorieView.titleLabel.text = "CHOISIR UNE CATÉGORIE"
    }
    
    func getCategorieViewModel() -> CategorieListViewModel {
        let networkLayer = Networking()
        let providing = CategoriesProvider(network: networkLayer)
        return CategorieListViewModel(service: providing)
    }
    
    // fetch by categorie
    private func fetchByCategorie(){
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        
        //fetching
        viewModel.fetchCategories { result in
            
            switch result{
            case .success(let categories):
                self.arrayCategories = categories
                DispatchQueue.main.async {
                    self.categorieView.tableView.reloadData()
                    self.myActivityIndicator.stopAnimating()
                }
            case .failure(_):
                //j'ai pas eu le temps de gérer les erreurs ici
                print("erreur")
            }
            
        }
    }
    
    //MARK: Actions
    @objc func btnCloseTapped(){
        self.dismiss(animated: true) {
            
        }
    }
    
    private func dismissViewController(categorieId: Int) {
        let viewController = self.presentingViewController as! AnnouncementListVC
        viewController.selectCategorie = categorieId
        self.dismiss(animated: true) {
            //ios 13 management
            viewController.viewDidAppear(true)
        }
    }
}

// manage taleview delegate
extension CategorieListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCategories.count+1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Catégories"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if (indexPath.row == 0)
        {
            cell.textLabel?.text = NSLocalizedString("Toutes les catégories", comment: "Toutes les catégories string")
        }else{
            let categorie = self.arrayCategories[indexPath.row-1]
            
            cell.textLabel?.text = categorie.name
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var categorieId: Int = 0
        if (indexPath.row == 0)
        {
            categorieId = 0
            
        }else
        {
            categorieId = self.arrayCategories[indexPath.row-1].id
        }
        
        dismissViewController(categorieId: categorieId)
        
    }
}
