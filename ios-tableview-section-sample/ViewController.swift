//
//  ViewController.swift
//  ios-tableview-section-sample
//
//  Created on 2019/01/06.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var sectionTitles: [String] = []
    private var elements: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register (UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier:"TableViewCell")
        sectionTitles = ([Int])(0...5).map{ "セクション: " + String($0) }
        elements = ([Int])(0...5).map{ "セル: " + String($0) }
    }
    
    // Section数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    // Sectioのタイトル
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.sampleLabel.text = elements[indexPath.row]
        return cell
    }
}

