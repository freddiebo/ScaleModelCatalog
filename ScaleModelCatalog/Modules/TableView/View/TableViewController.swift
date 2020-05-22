//
//  TableViewController.swift
//  ScaleModelCatalog
//
//  Created by  Vladislav Bondarev on 03.04.2020.
//  Copyright © 2020 Vladislav Bondarev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var presenter: TableViewOutputProtocol!
    var models = [Model]()
    let cellReuseIdentifier = "cell"    
    var GroupManufacture = [String: [Model]]()
    var listOfManufacture = [String] ()
    var rowsInSections = [Int:Int] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Group by Manufacture"
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 40
        tableView.sectionFooterHeight = 0
        presenter?.viewDidLoad()
        //parseToGroup()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return rowsInSections.count//GroupManufacture.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        /*let key = listOfManufacture[section]
        if let value = GroupManufacture[key] {
           return value.count
        }*/
        if let value = rowsInSections[section] {
            return value == 0 ? 1 : value
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = listOfManufacture[indexPath.section]
        if let value = GroupManufacture[key] {
            presenter?.detailViewShow(model: value[indexPath.row], from: self)
        }
        //presenter?.detailViewShow(model: GroupManufacture[listOfManufacture[indexPath.section]], from: self)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        sectionHeaderView.tag = section
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(sectionTap(_:)))
        sectionHeaderView.addGestureRecognizer(tap)
        
        let labelManufacture = UILabel()
        labelManufacture.frame = CGRect(x: 10, y: 10, width: tableView.frame.width, height: 20)
        labelManufacture.text = listOfManufacture[section]
        sectionHeaderView.addSubview(labelManufacture)
        
        return sectionHeaderView
    }
    
    @objc func sectionTap(_ sender:UITapGestureRecognizer) {
        let numberSection = sender.view!.tag
        var numberOfRows = rowsInSections[numberSection]
        
        if numberOfRows == 0 {
            let key = listOfManufacture[numberSection]
            if let value = GroupManufacture[key] {
               numberOfRows = value.count
            }
        } else {
            numberOfRows = 0
        }
        rowsInSections[numberSection] = numberOfRows
        tableView.reloadSections([numberSection], with: .automatic)
    }
    
    func getRowsToSection(){
        for numberSection in 0 ..< listOfManufacture.count {
            let key = listOfManufacture[numberSection]
            if let value = GroupManufacture[key] {
                rowsInSections[numberSection] = value.count
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowsInSections[indexPath.section] == 0 ? 0 : 44.0
    }
}

// MARK: - TableViewInputProtocol
extension TableViewController: TableViewInputProtocol {
    func reloadInterface(with models:[Model], groupedModels: [String : [Model]], by group: [String])  {
        self.models = models
        self.GroupManufacture = groupedModels
        self.listOfManufacture = group
        getRowsToSection()
        tableView.reloadData()
    }
}
