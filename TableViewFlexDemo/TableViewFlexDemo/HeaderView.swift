//
//  HeaderView.swift
//  TableViewFlexDemo
//
//  Created by junjie on 2019/3/28.
//  Copyright © 2019 junjie. All rights reserved.
//

import UIKit
typealias clickClosure = (_ tag: Int) -> ()
class HeaderView: UIView {
    var clickTapClosure: clickClosure!
    init(frame: CGRect, name: String) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let taper = UITapGestureRecognizer.init(target: self, action: #selector(clickTap(tap:)))
        self.addGestureRecognizer(taper)
        self.isUserInteractionEnabled = true
        
        let namelabel = UILabel.init(frame: CGRect(x: 10, y: 5, width: 130, height: 30))
        self.addSubview(namelabel)
        namelabel.textColor = UIColor.black
        namelabel.font = UIFont.systemFont(ofSize: 13)
        namelabel.textAlignment = .left
        namelabel.text = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickTap(tap: UITapGestureRecognizer)  {
        if let _ = clickTapClosure {
            clickTapClosure((tap.view?.tag)!)
        }
    }
    
}
