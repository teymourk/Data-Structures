//
//  DataStructuresView.swift
//  Practice
//
//  Created by Kiarash Teymoury on 11/3/17.
//  Copyright © 2017 Kiarash Teymoury. All rights reserved.
//

import UIKit

class DataStructuresView: UICollectionViewController {

    fileprivate struct buttonNames {
        let add = "Add"
        let done = "Done"
    }
    
    fileprivate var structVar: buttonNames {
        return buttonNames()
    }
    
    let stringStack = Stack<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        self.title = "Something"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        self.collectionView?.backgroundColor = .white
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    }
    
    fileprivate func setupNavBar() {
        let addBtn = UIBarButtonItem(title: structVar.add, style: .plain, target: self, action: #selector(onNavBarItems(sender:)))
        let doneBtn = UIBarButtonItem(title: structVar.done, style: .plain, target: self, action: #selector(onNavBarItems(sender:)))
        navigationItem.rightBarButtonItem = addBtn
        navigationItem.leftBarButtonItem = doneBtn
    }
    
    @objc
    fileprivate func onNavBarItems(sender: UIBarButtonItem) {
        let buttonTitle = sender.title ?? ""
        switch buttonTitle {
        case structVar.add:
                displayAlert()
        case structVar.done:
            navigationController?.dismiss(animated: true, completion: nil)
        default: break
        }
    }
    
    fileprivate func displayAlert() {
        let composeAlert = UIAlertController(title: "New", message: "Enter New Value", preferredStyle: .alert)
        composeAlert.addTextField { (textField) in
            textField.placeholder = "Value"
        }
        composeAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        composeAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            if let value = composeAlert.textFields?.first?.text {
                self.stringStack.push(value)
                self.collectionView?.reloadData()
                print(self.stringStack.count)
            }
        }))
        
        self.present(composeAlert, animated: true, completion: nil)
    }
}

extension DataStructuresView: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stringStack.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .red
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width,
                      height: 40)
    }
}
