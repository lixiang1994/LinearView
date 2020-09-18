//
//  HorizontalViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class HorizontalViewController: UIViewController {

    lazy var linearView = LinearView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 同UIStackView一致 水平排列布局 必须设置视图高度 宽度不设置会依据子视图高度自动布局
        
        //setupA()
        setupB()
        setupViews()
    }
    
    /// NSLayoutConstraint
    private func setupA() {
        view.addSubview(linearView)
        linearView.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        linearView.layer.shadowOffset = .zero
        linearView.layer.shadowRadius = 20
        linearView.layer.shadowOpacity = 0.2
        linearView.translatesAutoresizingMaskIntoConstraints = false
                
        view.addConstraints([
            .init(
                item: linearView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            .init(
                item: linearView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            )
        ])
                
        linearView.addConstraints([
            .init(
                item: linearView,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .height,
                multiplier: 1,
                constant: 200
            )
        ])
    }
    
    /// SnapKit
    private func setupB() {
        view.addSubview(linearView)
        linearView.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        linearView.layer.shadowOffset = .zero
        linearView.layer.shadowRadius = 20
        linearView.layer.shadowOpacity = 0.2
        
        linearView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    private func setupViews() {
        let a = UIView()
        a.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.2509803922, blue: 0.3176470588, alpha: 1)
        
        a.snp.makeConstraints { (make) in
            make.width.equalTo(20)
        }
        
        let b = UIView()
        b.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.4117647059, blue: 0.4705882353, alpha: 1)
        
        b.snp.makeConstraints { (make) in
            make.width.equalTo(40)
        }
        
        let c = UIView()
        c.backgroundColor = #colorLiteral(red: 0.5176470588, green: 0.662745098, blue: 0.6745098039, alpha: 1)
        
        c.snp.makeConstraints { (make) in
            make.width.equalTo(80)
        }
        
        let d = UIView()
        d.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        
        d.snp.makeConstraints { (make) in
            make.width.equalTo(160)
        }
        
        linearView.layout(.horizontal)
        .view(a)
        .view(b)
        .view(c)
        .view(d)
        .finish()
    }
}

