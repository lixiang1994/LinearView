//
//  HorizontalFixedViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class HorizontalFixedViewController: UIViewController {

    lazy var linearView = LinearView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 同UIStackView一致 水平排列布局 必须设置视图高度. 如果设置了宽度, 子视图则会自适应间距.
        
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
            make.width.equalTo(340)
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    private func setupViews() {
        let a = UIView()
        a.backgroundColor = #colorLiteral(red: 0.5254901961, green: 0.4588235294, blue: 0.662745098, alpha: 1)
        
        a.snp.makeConstraints { (make) in
            make.width.equalTo(20)
        }
        
        let b = UIView()
        b.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.6823529412, blue: 0.8392156863, alpha: 1)
        
        b.snp.makeConstraints { (make) in
            make.width.equalTo(40)
        }
        
        let c = UIView()
        c.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.7333333333, blue: 0.8117647059, alpha: 1)
        
        c.snp.makeConstraints { (make) in
            make.width.equalTo(80)
        }
        
        let d = UIView()
        d.backgroundColor = #colorLiteral(red: 1, green: 0.8352941176, blue: 0.8039215686, alpha: 1)
        
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
