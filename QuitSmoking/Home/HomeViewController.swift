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

    
    var TextView : UILabel = {
        let text = UILabel()
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
        button.backgroundColor = graycolor
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
    
    var successButton:BaseButton = {
        let button = BaseButton(frame: .zero)
        button.setTitle("오늘하루 성공", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    var failButton:BaseButton = {
        let button = BaseButton(frame: .zero)
        button.setTitle("흡연", for: .normal)
        button.backgroundColor = UIColor.systemRed
        return button
    }()
    
    var suppressButton:BaseButton = {
        let button = BaseButton(frame: .zero)
        button.backgroundColor = graycolor
        button.setTitle("힘들때 참기", for: .normal)
        return button
    }()
    
    
    var LineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryLabel
        return view
    }()
    
    let quitView = QuitTimeView()
    let smokingView = SmokingTimeView()
    let wiseView = WiseView()
    

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTarget()
        setUpViews()
    }
    
    func setButtonTarget(){
        successButton.addTarget(self, action: #selector(tappedSuccessButton), for: .touchUpInside)
        failButton.addTarget(self, action: #selector(tappedFailButton), for: .touchUpInside)
        suppressButton.addTarget(self, action: #selector(tappedSupressButton), for: .touchUpInside)
        titleButton.addTarget(self, action: #selector(tappedTitleButton), for: .touchUpInside)
    }
    
    func setUpViews(){
        view.backgroundColor = graycolor
        
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
            LineView,
            quitView,
            smokingView,
            wiseView
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
        
        quitView.snp.makeConstraints{
            $0.top.equalTo(LineView.snp.bottom).offset(20)
            $0.leading.equalTo(LineView.snp.leading)
            $0.trailing.equalTo(LineView.snp.trailing)
        }
        
        smokingView.snp.makeConstraints{
            $0.top.equalTo(quitView.snp.bottom).offset(20)
            $0.leading.equalTo(quitView.snp.leading)
            $0.trailing.equalTo(quitView.snp.trailing)
        }
        
        wiseView.snp.makeConstraints{
            $0.top.equalTo(smokingView.snp.bottom).offset(20)
            $0.leading.equalTo(smokingView.snp.leading)
            $0.trailing.equalTo(smokingView.snp.trailing)
        }
    }
    
    @objc func tappedTitleButton(){
        print("Tapped Tilte Button")
    }
    
    @objc func tappedSuccessButton(){
        print("Tapped success Button")
    }
    @objc func tappedFailButton(){
        print("Tapped Fail Button")
    }
    @objc func tappedSupressButton(){
        print("Tapped Supress Button")
    }

}
