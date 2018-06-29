//
//  GLOneTableViewCell.swift
//  GLSwift4.0
//
//  Created by gongliang on 2018/2/27.
//  Copyright © 2018年 gongliang. All rights reserved.
//

import UIKit

class GLOneTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    func addDataWithModel(model: mainModel , indexPath: IndexPath) {
        self.textLabel?.text = model.tableViewArray[indexPath.section]
        self.detailTextLabel?.text = "Nica"
        detailTextLabel?.textColor = UIColor.red
        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        //显示点击了那行
        self.setSelected(false, animated: false)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
