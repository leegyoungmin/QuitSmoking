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
        button.addTarget(self, action: #selector(tappedTitleButton), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        return button
    }()
    
    var successButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("하루 성공", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedSuccessButton), for: .touchUpInside)
        return button
    }()
    
    var failButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("흡연", for: .normal)
        button.backgroundColor = UIColor.systemRed
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedSuccessButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
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
            successButton,
            failButton
        ].forEach{
            view.addSubview($0)
        }
        
        stackView.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).inset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(40)
        }
        
        //TODO: - 타이머 설정 및 타이머 UI 설정
        
        successButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(stackView.snp.bottom).offset(300)
            $0.height.equalTo(40)
            $0.width.equalTo(150)
        }
        failButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(stackView.snp.bottom).offset(300)
            $0.height.equalTo(40)
            $0.width.equalTo(150)
        }
        
    }
    
    @objc func tappedTitleButton(){
        print("Tapped Tilte Button")
    }
    
    @objc func tappedSuccessButton(){
        print("Tapped Success Button")
    }
}
