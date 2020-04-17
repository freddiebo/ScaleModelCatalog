//
//  TableViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 03.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var presenter: TablePresenterProtocol?
    var models = [Model]()
    let cellReuseIdentifier = "cell"    
    var GroupManufacture = [String: [Model]]()
    var listOfManufacture = [String] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Group by Manufacture"
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = self
        presenter?.viewDidLoad()
        //parseToGroup()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return GroupManufacture.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let key = listOfManufacture[section]
        if let value = GroupManufacture[key] {
           return value.count
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        let key = listOfManufacture[indexPath.section]
        if let value = GroupManufacture[key] {
            cell.textLabel?.text = value[indexPath.row].name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listOfManufacture[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = listOfManufacture[indexPath.section]
        if let value = GroupManufacture[key] {
            presenter?.detailViewShow(model: value[indexPath.row], from: self)
        }
        //presenter?.detailViewShow(model: GroupManufacture[listOfManufacture[indexPath.section]], from: self)
    }

}

extension TableViewController: TableViewProtocol {
    func reloadInterface(with models:[Model], groupedModels: [String : [Model]], by group: [String])  {
        self.models = models
        self.GroupManufacture = groupedModels
        self.listOfManufacture = group
        tableView.reloadData()
    }
}
