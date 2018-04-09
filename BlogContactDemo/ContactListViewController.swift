//
//  ContactListViewController.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {
    fileprivate let cellId = "cellId"
    fileprivate var dataSources: [Contact] = ContactFixtures.initializeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(ContactListViewCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.title = "Contacts"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cellId) as? ContactListViewCell) ?? ContactListViewCell()
        let item = dataSources[indexPath.row]
        cell.nameValueLabel.text = item.name
        cell.phoneValueLabel.text = item.phoneNumber
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSources[indexPath.row]
        let controller = ContactDetailViewController(name: item.name, phone: item.phoneNumber)
        navigationController?.pushViewController(controller, animated: true)
    }
}
