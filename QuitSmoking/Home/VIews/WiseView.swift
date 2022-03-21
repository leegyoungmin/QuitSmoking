//
//  WiseView.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/21.
//

import Foundation
import UIKit

class WiseView:UIView{
    let wises:[wise] = Bundle.main.decode("wise.json")
    lazy var titleView:UILabel = {
        return UILabel().contentView(text: "오늘의 응원", fontSize: 20, textColor: .gray)
    }()
    
    lazy var sayerView:UILabel = {
        return UILabel().contentView(text: "", fontSize: 13, textColor: .black)
    }()
    
    lazy var wiseView:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        let stackView = UIStackView(arrangedSubviews: [titleView,wiseView,sayerView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5.0
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        let wise = wises[Int.random(in: 0...wises.count-1)]
        wiseView.text = wise.wise
        sayerView.text = wise.sayer
        
    }
}
