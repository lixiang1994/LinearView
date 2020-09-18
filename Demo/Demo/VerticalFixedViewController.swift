//
//  VerticalFixedViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class VerticalFixedViewController: UIViewController {

    lazy var linearView = LinearView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 同UIStackView一致 垂直排列布局 必须设置视图宽度. 如果设置了高度, 子视图则会自适应间距.
        
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
            make.height.equalTo(400)
            make.center.equalToSuperview()
        }
    }
    
    private func setupViews() {
        let a = UIView()
        a.backgroundColor = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.9529411765, alpha: 1)
        
        a.snp.makeConstraints { (make) in
            make.height.equalTo(20)
        }
        
        let b = UIView()
        b.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.8862745098, blue: 0.8078431373, alpha: 1)
        
        b.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        
        let c = UIView()
        c.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.968627451, blue: 0.8509803922, alpha: 1)
        
        c.snp.makeConstraints { (make) in
            make.height.equalTo(80)
        }
        
        let d = UIView()
        d.backgroundColor = #colorLiteral(red: 0.8117647059, green: 1, blue: 0.9960784314, alpha: 1)
        
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
