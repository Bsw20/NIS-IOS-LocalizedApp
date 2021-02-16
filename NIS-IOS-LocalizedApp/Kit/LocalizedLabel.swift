//
//  LocalizedLabel.swift
//  NIS-IOS-LocalizedApp
//
//  Created by Ярослав Карпунькин on 14.02.2021.
//

import Foundation
import UIKit


class LocalizedLabel: UILabel {
    init(key: String, comment: String, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.text = NSLocalizedString(key, comment: comment)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
