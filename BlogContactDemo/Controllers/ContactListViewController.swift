//
//  ContactListViewController.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import UIKit
import ReSwift

class ContactListViewController: UITableViewController {
    fileprivate let cellId = "cellId"
    fileprivate var dataSources: [Contact] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func fetchData() {
        store.dispatch(ContactListState.getContactList())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
        if store.state.contactListState.model == nil {
            fetchData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        store.unsubscribe(self)
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
        let controller = ContactDetailViewController(contact: item)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ContactListViewController: StoreSubscriber {
    func newState(state: AppState) {
        if let model = state.contactListState.model {
            dataSources = model
        }
    }
}
