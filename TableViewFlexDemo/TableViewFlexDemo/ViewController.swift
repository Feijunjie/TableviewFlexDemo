//
//  ViewController.swift
//  TableViewFlexDemo
//
//  Created by junjie on 2019/3/28.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    var headerSource: [String] = []
    var cellSource: [String] = []
    var flagSource: [Bool] = []
    
    let cellID = "TextTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.createUI()
    }
    
    func createUI() {
        headerSource = ["这是第一个header","这是第二个header","这是第三个header","这是第四个header"]
        cellSource = [
            "亲贤臣，远小人(40)，此先汉所以兴隆也；亲小人，远贤臣，此后汉所以倾颓(41)也。先帝在时，每与臣论此事，未尝不叹息痛恨(42)于桓、灵也。侍中、尚书、长史、参军，此悉贞良死节(43)之臣，愿陛下亲之信之，则汉室之隆(44)，可计日(45)而待也",
            "臣本布衣(46)，躬耕于(47)南阳(48)，苟全(49)性命于乱世，不求闻达于诸侯(50)。先帝不以臣卑鄙(51)，猥(52)自枉屈，三顾(53)臣于草庐之中，咨臣以当世之事，由是感激(54)，遂许先帝以驱驰(55)。后值倾覆，受任于败军之际，奉命于危难之间：尔来二十有(56)一年矣",
            "侍中、侍郎郭攸之、费祎、董允等，此皆良实，志虑忠纯(28)，是以先帝简拔以遗陛下(29)：愚以为宫中之事，事无大小，悉以咨之(30)，然后施行，必能裨补阙漏(31)，有所广益",
            "今当(77)远离，临表涕零(78)，不知所言"
        ]
        for _ in headerSource {
            flagSource.append(false)
        }
        tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        self.view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        tableView?.register(TextTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flagSource[section] {
            return 1
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerSource.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40), name: headerSource[section])
        view.tag = section + 100
        view.clickTapClosure = {[weak self] (index) in
            print("headerIndex == \(index)")
            if (self?.flagSource[index-100])! {
                self?.flagSource[index-100] = false
            } else {
                self?.flagSource[index-100] = true
            }
            tableView.reloadSections(IndexSet.init(integer: index-100), with: .automatic)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TextTableViewCell
        cell.reloadDataWithNameString(name: cellSource[indexPath.section])
        return cell
    }
    
    
}

