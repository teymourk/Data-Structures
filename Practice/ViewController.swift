//
//  ViewController.swift
//  Practice
//
//  Created by Kiarash Teymoury on 11/2/17.
//  Copyright © 2017 Kiarash Teymoury. All rights reserved.
//

import UIKit

struct DataStructures {
    var name: String
    init(_ name: String) {
        self.name = name
    }
}

class ViewController: UITableViewController {

    var dataStructuresArray: [DataStructures] {
        let linkedList = DataStructures("Linked List")
        let stack = DataStructures("Stack")
        let queue = DataStructures("Queue")
        return [linkedList,
                stack, queue]

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Data Structures"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.tableView.register(DataStructuresCell.self, forCellReuseIdentifier: "CellID")
        self.tableView.clearFooter()
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStructuresArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? DataStructuresCell
        let dataStructure = dataStructuresArray[indexPath.item]
            cell?.dataStructure = dataStructure
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layFlowLayout = UICollectionViewFlowLayout()
        let dataStructure = DataStructuresView(collectionViewLayout: layFlowLayout)
        let root = UINavigationController(rootViewController: dataStructure)
        navigationController?.present(root, animated: true, completion: nil)
    }
}

class DataStructuresCell: UITableViewCell {
    var nameLabel: UILabel = {
        let label = UILabel()
            label.textColor = .darkGray
            label.font = UIFont.systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    var dataStructure: DataStructures? {
        didSet {
            nameLabel.text = dataStructure?.name ?? ""
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

extension UITableView {
    func clearFooter() {
        let footerView = UIView(frame: .zero)
            footerView.backgroundColor = .white
        self.tableFooterView = footerView
    }
}
