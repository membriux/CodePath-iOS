//
//  ViewController.swift
//  SearchBarExample
//
//  Created by Memo on 12/8/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var searchaBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    let data = ["swift", "python", "java", "C", "C++", "R"]
    var filteredData: [String]!
    
    
    
    override func viewDidLoad() {
        searchaBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
        filteredData = data
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

