//
//  HomeViewController.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/13.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController:UIViewController{
    
    var TextView : UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = .systemFont(ofSize: 25)
        text.textAlignment = .left
        text.text = "건강 정보"
        return text
    }()
    
    var titleButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("단계 확인", for: .normal)
        button.addTarget(HomeViewController.self, action: #selector(tappedTitleButton), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        return button
    }()
    
    var timeText:UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.layer.cornerRadius = 100
        text.layer.backgroundColor = UIColor.lightGray.cgColor
        return text
    }()
    
    let successButton:BaseButton = {
        let button = BaseButton(frame: .zero)
        button.setTitle("오늘하루 성공", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tappedSuccessButton), for: .touchUpInside)
        return button
    }()
    
    var failButton:BaseButton = {
        let button = BaseButton(frame: .zero)
        button.setTitle("흡연", for: .normal)
        button.backgroundColor = UIColor.systemRed
        button.addTarget(self, action: #selector(tappedFailButton), for: .touchUpInside)
        return button
    }()
    
    var suppressButton:BaseButton = {
        let button = BaseButton(frame: .zero)
        button.backgroundColor = .lightGray
        button.setTitle("힘들때 참기", for: .normal)
        button.addTarget(self, action: #selector(tappedSupressButton), for: .touchUpInside)
        return button
    }()
    
    
    var LineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryLabel
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.calculateDate()
        }
    }
    
    func setUpViews(){
        
        //MARK: - Button Const
        titleButton.snp.makeConstraints{
            $0.height.equalTo(40)
            $0.width.equalTo(80)
        }
        
        //MARK: - Create StackView
        let stackView = UIStackView(arrangedSubviews: [TextView,titleButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        
        
        //MARK: - StackView const
        view.addSubview(stackView)
        
        [
            timeText,
            successButton,
            failButton,
            suppressButton,
            LineView
        ].forEach{
            view.addSubview($0)
        }
        
        stackView.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).inset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(40)
        }
        
        timeText.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.centerX.equalTo(stackView.snp.centerX)
            $0.height.width.equalTo(200)
        }
        successButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(timeText.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
        }
        
        failButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(timeText.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
        }
        
        suppressButton.snp.makeConstraints{
            $0.top.equalTo(successButton.snp.bottom).offset(10)
            $0.leading.equalTo(successButton.snp.leading)
            $0.trailing.equalTo(failButton.snp.trailing)
            $0.height.equalTo(50)
        }
        
        LineView.snp.makeConstraints{
            $0.top.equalTo(suppressButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(2)
        }
    }
    
    @objc func tappedTitleButton(){
        print("Tapped Tilte Button")
    }
    
    @objc func tappedSuccessButton(){
        self.calculateDate()
    }
    @objc func tappedFailButton(){
        print("Tapped Fail Button")
    }
    @objc func tappedSupressButton(){
        print("Tapped Supress Button")
    }

}

extension HomeViewController{
    func calculateDate(){
        let calendar = Calendar(identifier: .gregorian)
        let comp = DateComponents(year:2021,month: 3,day: 17)
        if let startDate = calendar.date(from: comp){
            let offsetComps = calendar.dateComponents([.day,.hour,.minute,.second], from: startDate, to: Date())
            if case let (d?,h?,m?,s?) = (offsetComps.day,offsetComps.hour,offsetComps.minute,offsetComps.second){
                timeText.text = "\(d)일 \(h)시간 \(m)분 \(s)초"
            }
        }
    }
}
