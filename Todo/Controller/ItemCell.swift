//
//  ItemCell.swift
//  Todo
//
//  Created by Jose Alvarez on 7/27/17.
//  Copyright © 2017 CoStar. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    func configCell(with item: ToDoItem, checked: Bool = false) {
        if checked {
            let attributedString = NSAttributedString(
                string: item.title,
                attributes: [NSStrikethroughStyleAttributeName:
                    NSUnderlineStyle.styleSingle.rawValue])
            
            
            titleLabel?.attributedText = attributedString
            locationLabel?.text = nil
            dateLabel?.text = nil
        } else {
            titleLabel?.text = item.title
            locationLabel?.text = item.location?.name
            
            
            if let timestamp = item.timestamp {
                let date = Date(timeIntervalSince1970: timestamp)
                
                
                dateLabel?.text = dateFormatter.string(from: date)
            } 
        }
    }
}
