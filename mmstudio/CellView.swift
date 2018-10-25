//
//  CellView.swift
//  mmstudio
//
//  Created by VANSA PHA on 10/23/18.
//  Copyright © 2018 Vansa Pha. All rights reserved.
//

import UIKit
import MIDITimeTableView

class CellView: MIDITimeTableCellView {

    var titleLabel = UILabel()
    var selectedBorderColor: UIColor = .yellow
    var defaultBorderColor: UIColor = .black
    
    override var isSelected: Bool {
        didSet {
            titleLabel.layer.borderColor = (isSelected ? selectedBorderColor : defaultBorderColor).cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        commonInit()
        titleLabel.text = title
    }
    
    func commonInit() {
        backgroundColor = .clear
        addSubview(titleLabel)
        titleLabel.backgroundColor = #colorLiteral(red: 0.975289762, green: 0.358186841, blue: 0.2708096504, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.borderColor = UIColor.black.cgColor
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.cornerRadius = 5
        customMenuItems = [
            MIDITimeTableCellViewCustomMenuItem(
                title: "Custom Menu Item",
                action: #selector(didPressCustomMenuItem))
        ]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(origin: .zero, size: frame.size)
    }
    
    @objc func didPressCustomMenuItem() {
        print("custom menu item pressed")
    }

}
