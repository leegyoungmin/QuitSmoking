//
//  Extension.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/17.
//

import Foundation
import UIKit

let graycolor = UIColor(white: 0, alpha: 0.1)


func decimalNumber(data:NSNumber)->String{
    let numberformat = NumberFormatter()
    numberformat.numberStyle = .decimal
    return numberformat.string(from: data)!
}

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

extension UILabel{
    func contentView(text:String,fontSize:CGFloat,textColor:UIColor) -> UILabel{
        let label = UILabel()
        label.textColor = textColor
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
}
