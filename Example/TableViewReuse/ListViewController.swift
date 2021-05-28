//
//  ListViewController.swift
//  TableViewReuse_Example
//
//  Created by bo.chen on 2021/5/31.
//

import UIKit
import TableViewReuse

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    var listViewModel = ListViewModel()
    
    var list: [ListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        listViewModel.bindingCallback = { [weak self] (list) in
            guard let self = self else { return }
            self.list = list
            self.tableView.reloadData()
        }
    }
    
    func setupUI() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 44.0
        } else {
            return 70.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            // MARK: Call the Swift API
            let cell = tableView.reuseCell(nibClass: NibListTableViewCell.self) // Swift Method
            // MARK: Call the Objective-C API
            // let cell = tableView.reuseCell(withNibClass: NibListTableViewCell.self) as! NibListTableViewCell // Objective-C Method
            let md = self.list[indexPath.row]
            cell.titleLabel.text = md.name ?? "noname"
            cell.descLabel.text = md.pdUpdateTime ?? "notime"
            return cell
        } else {
            // MARK: Call the Swift API
//            let cell = tableView.reuseCell(anyClass: AnyClassTableViewCell.self) // Swift Method
            // MARK: Call the Objective-C API
            let cell = tableView.reuseCell(withAnyClass: AnyClassTableViewCell.self) as! AnyClassTableViewCell // Objective-C Method
            let md = self.list[indexPath.row]
            cell.nameLabel.text = md.name ?? "noname"
            cell.timeLabel.text = md.pdUpdateTime ?? "notime"
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
