//
//  AlignmentViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/18.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class AlignmentViewController: UIViewController {

    lazy var linearView = LinearView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupViews()
    }
    
    private func setup() {
        linearView.backgroundColor = .white
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
        a.backgroundColor = #colorLiteral(red: 1, green: 0.9176470588, blue: 0.9960784314, alpha: 1)
        
        a.snp.makeConstraints { (make) in
            make.height.equalTo(20)
        }
        
        let b = UIView()
        b.backgroundColor = #colorLiteral(red: 0.8, green: 0.7568627451, blue: 1, alpha: 1)
        
        b.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        
        let c = UIView()
        c.backgroundColor = #colorLiteral(red: 0.6196078431, green: 0.662745098, blue: 0.9411764706, alpha: 1)
        
        c.snp.makeConstraints { (make) in
            make.height.equalTo(80)
        }
        
        let d = UIView()
        d.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.2352941176, blue: 0.5450980392, alpha: 1)
        
        d.snp.makeConstraints { (make) in
            make.height.equalTo(160)
        }
        
        linearView.layout(.vertical)
        .spacing(10)
        .view(.init(a, layout: .constant(160, .center)))
        .spacing(10)
        .view(.init(b, layout: .constant(160, .leading)))
        .spacing(20)
        .view(.init(c, layout: .constant(160, .trailing)))
        .spacing(30)
        .view(.init(d, layout: .constant(160, .leading(10))))
        .spacing(10)
        .done()
    }
}
