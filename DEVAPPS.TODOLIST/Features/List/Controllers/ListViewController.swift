//
//  ListViewController.swift
//  DEVAPPS.TODOLIST
//
//  Created by priscylla.d.valenca on 10/08/20.
//  Copyright © 2020 Priscylla Diniz. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fabButton: CircleButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isLandscape: Bool = false {
        didSet {
            animateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureCollectionView()
        
        configureNavigationBar()
        fabButton.isHidden = traitCollection.verticalSizeClass == .compact
        isLandscape = traitCollection.verticalSizeClass == .compact
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
         //Regular means landscape & compact means portrait
        isLandscape = newCollection.verticalSizeClass == .compact
        fabButton.isHidden = newCollection.verticalSizeClass == .compact
        configureCollectionView(willTransition: true)
        collectionView.reloadData()
        
    }
}

//MARK: Configuration methods extension
extension ListViewController{
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ToDoListTableViewCellID")
    }
    
    
    private func configureCollectionView(willTransition: Bool = false) {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        var width = UIScreen.main.bounds.size.width
        var heigth = UIScreen.main.bounds.size.height
        
        if willTransition {
            width = UIScreen.main.bounds.size.height
            heigth = UIScreen.main.bounds.size.width
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ((width - 128) / 3) , height: heigth * 0.7)
        
        collectionView.collectionViewLayout = layout
        
        
        let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ListCollectionViewCellID")
    }
    
    private func configureNavigationBar() {
          navigationController?.setNavigationBarHidden(true, animated: true)
      }
    
    private func animateViews() {
        UIView.animate(withDuration: 0.3) {
            self.tableView.isHidden = self.isLandscape
            self.collectionView.isHidden = !self.isLandscape
        }
    }
}

//MARK: Actions methods extension
extension ListViewController {
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Add", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoDataSource.shared.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListTableViewCellID") as? ListTableViewCell
        else{
            return UITableViewCell()
        }
        
        cell.configure(with: TodoDataSource.shared.todos[indexPath.row])
        return cell
    }
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TodoModel.ModelType.allTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCellID", for: indexPath) as? ListCollectionViewCell
               else{
                   return UICollectionViewCell()
               }
        
        
        if TodoDataSource.shared.todos.count > indexPath.row {
            cell.configureCollection(with:TodoDataSource.shared.todos[indexPath.row])
        }
        
          return cell 
        
    }
}
    


