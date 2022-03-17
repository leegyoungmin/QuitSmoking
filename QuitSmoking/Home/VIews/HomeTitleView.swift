//
//  HomeTitleView.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/18.
//

import Foundation
import UIKit

class HomeTitleView:UIView{
    
    lazy var title:UILabel = {
        return UILabel().contentView(text: "금연 기간", fontSize: 25,textColor: .gray)
    }()
    
    lazy var contentView:UILabel = {
        return UILabel().contentView(text: "", fontSize: 15,textColor: .black)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayOut()
        // 데이터 업데이트는 화면을 그리고 난 후 실행된다.
        // 뷰가 생성되기 전에 생성하여서 뿌리는 방법은 무엇인가?
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.calculateDate()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayOut(){
        let stackView = UIStackView(arrangedSubviews: [title,contentView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4.0
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(20)
        }
    }
}

extension HomeTitleView{
    func calculateDate(){
        let calendar = Calendar(identifier: .gregorian)
        let comp = DateComponents(year:2022,month: 3,day: 13)
        if let startDate = calendar.date(from: comp){
            let offsetComps = calendar.dateComponents([.day,.hour,.minute,.second], from: startDate, to: Date())
            if case let (d?,h?,m?,s?) = (offsetComps.day,offsetComps.hour,offsetComps.minute,offsetComps.second){
                contentView.text = "\(d)일 \(h)시간 \(m)분 \(s)초"
            }
        }
    }
}
