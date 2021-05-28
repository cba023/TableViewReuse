//
//  AnyClassTableViewCell.swift
//  TableViewReuse_Example
//
//  Created by bo.chen on 2021/5/31.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class AnyClassTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let timeLabel = UILabel()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.textColor = .red
        nameLabel.frame = CGRect(x: 40, y: 10, width: 300, height: 20)
        
        contentView.addSubview(timeLabel)
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.textColor = .green
        timeLabel.frame = CGRect(x: 40, y: 40, width: 300, height: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
