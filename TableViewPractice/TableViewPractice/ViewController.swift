//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Memo on 1/7/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    
    let students: [String] = ["Memo", "Anthony", "David", "John", "Donald"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentCell
        
        let student = students[indexPath.row]
        cell.studentNameLabel.text = student
        return cell
        
    }
    
}

