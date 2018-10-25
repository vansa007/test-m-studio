//
//  HeaderCellView.swift
//  mmstudio
//
//  Created by VANSA PHA on 10/23/18.
//  Copyright © 2018 Vansa Pha. All rights reserved.
//

import UIKit
import MIDITimeTableView

class HeaderCellView: MIDITimeTableHeaderCellView {
    var titleLabel = UILabel()
    
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
        addSubview(titleLabel)
        backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        titleLabel.textColor = UIColor(red: 216.0/255.0, green: 214.0/255.0, blue: 217.0/255.0, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(origin: .zero, size: frame.size)
    }
}
