//
//  VerticalViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class VerticalViewController: UIViewController {

    lazy var linearView = LinearView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 同UIStackView一致 垂直排列布局 必须设置视图宽度 高度不设置会依据子视图高度自动布局
        
        setup()
        setupViews()
    }
    
    private func setup() {
        view.addSubview(linearView)
        linearView.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        linearView.layer.shadowOffset = .zero
        linearView.layer.shadowRadius = 20
        linearView.layer.shadowOpacity = 0.2
        
        linearView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    private func setupViews() {
        let a = UIView()
        a.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.431372549, blue: 0.4745098039, alpha: 1)
        
        a.snp.makeConstraints { (make) in
            make.height.equalTo(20)
        }
        
        let b = UIView()
        b.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.6941176471, blue: 0.5960784314, alpha: 1)
        
        b.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        
        let c = UIView()
        c.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8274509804, blue: 0.7647058824, alpha: 1)
        
        c.snp.makeConstraints { (make) in
            make.height.equalTo(80)
        }
        
        let d = UIView()
        d.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9254901961, blue: 0.8901960784, alpha: 1)
        
        d.snp.makeConstraints { (make) in
            make.height.equalTo(160)
        }
        
        linearView.layout(.vertical)
        .view(a)
        .view(b)
        .view(c)
        .view(d)
        .finish()
    }
}
