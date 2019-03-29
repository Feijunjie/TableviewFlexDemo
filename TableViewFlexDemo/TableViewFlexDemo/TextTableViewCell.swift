//
//  TextTableViewCell.swift
//  TableViewFlexDemo
//
//  Created by junjie on 2019/3/29.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit
import SnapKit
class TextTableViewCell: UITableViewCell {
    var titleLabel: UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        titleLabel = UILabel.init()
        self.contentView.addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        })
        titleLabel?.textAlignment = .left
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
        titleLabel?.textColor = UIColor.black
        titleLabel?.numberOfLines = 0
    }
    
    func reloadDataWithNameString(name: String) {
        titleLabel?.text = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
