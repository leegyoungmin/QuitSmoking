//
//  SmokingTimeView.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/18.
//

import Foundation
import UIKit

class SmokingTimeView:UIView{
    lazy var smokingTitle:UILabel = {
        return UILabel().contentView(text: "흡연 기간", fontSize: 20,textColor: .gray)
    }()
    
    lazy var smokingTime:UILabel = {
        return UILabel().contentView(text: "", fontSize: 15,textColor: .black)
    }()
    lazy var smokingSaveTitle:UILabel = {
        return UILabel().contentView(text: "사용 금액", fontSize: 20, textColor: .gray)
    }()
    
    lazy var smokingSaveMoney:UILabel = {
        return UILabel().contentView(text: "", fontSize: 15, textColor: .black)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        DispatchQueue.main.async {
            self.setUpLayOut()
            // 데이터 업데이트는 화면을 그리고 난 후 실행된다.
            // 뷰가 생성되기 전에 생성하여서 뿌리는 방법은 무엇인가?
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.calculateDate()
            }
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayOut(){
        let stackView = UIStackView(arrangedSubviews: [smokingTitle,smokingTime,smokingSaveTitle,smokingSaveMoney])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5.0
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension SmokingTimeView{
    func calculateDate(){
        let calendar = Calendar(identifier: .gregorian)
        let comp = DateComponents(year:2019,month: 1,day: 1)
        if let startDate = calendar.date(from: comp){
            let offsetComps = calendar.dateComponents([.day,.hour,.minute,.second], from: startDate, to: Date())
            if case let (d?,h?,m?,s?) = (offsetComps.day,offsetComps.hour,offsetComps.minute,offsetComps.second){
                smokingTime.text = "\(d)일 \(h)시간 \(m)분 \(s)초"
                guard let money = d*4500 as? NSNumber else{return}
                smokingSaveMoney.text = "\(decimalNumber(data: money)) 원"
            }
        }
    }
}
