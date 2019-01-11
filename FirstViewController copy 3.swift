//
//  FirstViewController.swift
//  wechatdemo1
//
//  Created by hsbc on 1/10/19.
//  Copyright © 2019 ven. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController{

    var data = [
        ("A", [("钱包","first.png")]),
        ("B", [("收藏","first.png"),("相册","second.png"),("卡包","first.png"),("表情","second.png")]),
        ("C", [("设置","first.png")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title  = "我"
        self.view.backgroundColor = .white
        self.tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.grouped)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // set tableView how  section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    // ste each tableView height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // set each tableView content
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:2.0)
        let viewLabel = UILabel(frame: CGRect(x: 10, y: 10, width: UIScreen.main.bounds.size.width, height: 30))
        //viewLabel.text = data[section].0
        viewLabel.textColor = UIColor(red:0.31, green:0.31, blue:0.31, alpha:2.0)
        view.addSubview(viewLabel)
        tableView.addSubview(view)
        return view
    }
    // caculate each section quantity
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
    
    // fill data into  UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        cell.imageView?.image = UIImage(named: data[indexPath.section].1[indexPath.row].1)
        cell.textLabel?.text = data[indexPath.section].1[indexPath.row].0
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

