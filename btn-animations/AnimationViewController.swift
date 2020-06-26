//
//  AnimationViewController.swift
//  btn-animations
//
//  Created by Dheeraj Kumar Sharma on 26/06/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

enum States {
    case open
    case close
}

struct CustomColor {
    static let creamy:UIColor = UIColor(red: 254/255, green: 180/255, blue: 123/255, alpha: 1)
    static let brown:UIColor = UIColor(red: 184/255, green: 120/255, blue: 83/255, alpha: 1)
}

class AnimationViewController: UIViewController {
    
    var btnState:States?
    lazy var addBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = CustomColor.brown
        btn.layer.cornerRadius = 35
        btn.addTarget(self, action: #selector(addBtnPressed), for: .touchUpInside)
        btn.setImage(UIImage(named: "add"), for: .normal)
        return btn
    }()
    
    let btn1:UIButton = {
       let btn = UIButton()
       btn.translatesAutoresizingMaskIntoConstraints = false
       btn.backgroundColor = .white
       btn.layer.cornerRadius = 30
       return btn
    }()
    
    let btn2:UIButton = {
       let btn = UIButton()
       btn.translatesAutoresizingMaskIntoConstraints = false
       btn.backgroundColor = .white
       btn.layer.cornerRadius = 30
       return btn
    }()
    
    let btn3:UIButton = {
       let btn = UIButton()
       btn.translatesAutoresizingMaskIntoConstraints = false
       btn.backgroundColor = .white
       btn.layer.cornerRadius = 30
       return btn
    }()
    
    let btn4:UIButton = {
       let btn = UIButton()
       btn.translatesAutoresizingMaskIntoConstraints = false
       btn.backgroundColor = .white
       btn.layer.cornerRadius = 30
       return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.creamy
        view.addSubview(btn1)
        view.addSubview(btn2)
        view.addSubview(btn3)
        view.addSubview(btn4)
        view.addSubview(addBtn)
        setUpConstraints()
    }

    func setUpConstraints(){
        NSLayoutConstraint.activate([
            addBtn.heightAnchor.constraint(equalToConstant: 70),
            addBtn.widthAnchor.constraint(equalToConstant: 70),
            addBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btn1.heightAnchor.constraint(equalToConstant: 60),
            btn1.widthAnchor.constraint(equalToConstant: 60),
            btn1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btn2.heightAnchor.constraint(equalToConstant: 60),
            btn2.widthAnchor.constraint(equalToConstant: 60),
            btn2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btn3.heightAnchor.constraint(equalToConstant: 60),
            btn3.widthAnchor.constraint(equalToConstant: 60),
            btn3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            btn4.heightAnchor.constraint(equalToConstant: 60),
            btn4.widthAnchor.constraint(equalToConstant: 60),
            btn4.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func addBtnPressed(){
        
        if btnState == .close {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                
                self.btn1.center.y += 80
                self.btn2.center.y -= 80
                self.btn3.center.x += 80
                self.btn4.center.x -= 80
                
                self.addBtn.transform = .identity
                
                self.btnState = .open
            } ,completion:nil)
        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                
                self.btn1.center.y -= 80
                self.btn2.center.y += 80
                self.btn3.center.x -= 80
                self.btn4.center.x += 80
                self.addBtn.transform = CGAffineTransform(rotationAngle: .pi/4)
                
                self.btnState = .close
            } ,completion:nil)
        }
        
    }
    
}
