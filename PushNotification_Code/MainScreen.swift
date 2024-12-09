//
//  MainScreen.swift
//  PushNotification_Code
//
//  Created by Haris Gunasekaran on 12/8/24.
//

import UIKit

class MainScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var button : UIButton!
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          self.backgroundColor = .white
          
         setupButton()
      }

    func setupButton(){
        button = UIButton(type: .system)
        button.setTitle("Send Notification", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        self.addSubview(button)
    }
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
           
            button.widthAnchor.constraint(equalToConstant: 48),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
