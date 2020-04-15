//
//  TableViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 03.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, TableViewProtocol {
    var presenter: TablePresenterProtocol?
    var models = [Model]()
    let cellReuseIdentifier = "cell"    
    var GroupManufacture = [String: [Model]]()
    var listOfManufacture = [String] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Group by Manufacture"
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.dataSource = self
        presenter?.viewDidLoad()
        //parseToGroup()
    }
    
    func reloadInterface(with models:[Model], groupedModels: [String : [Model]], by group: [String])  {
        self.models = models
        self.GroupManufacture = groupedModels
        self.listOfManufacture = group
        tableView.reloadData()
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
        presenter?.detailViewShow(model: models[indexPath.row], from: self)
    }

}