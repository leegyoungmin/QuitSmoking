//
//  Extension.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/17.
//

import Foundation
import UIKit


class BaseButton:UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
