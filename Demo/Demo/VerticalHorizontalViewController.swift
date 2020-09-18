//
//  VerticalHorizontalViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class VerticalHorizontalViewController: UIViewController {

    lazy var linearView = LinearView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        func map(_ colors: [UIColor]) -> [UIView] {
            return colors.enumerated().map { (index, color) -> UIView in
                let view = UIView()
                view.backgroundColor = color
                
                view.snp.makeConstraints { (make) in
                    make.width.equalTo(20 * (index + 1))
                }
                return view
            }
        }
        
        let a = LinearView()
        a.layout(.horizontal).views(map([#colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.831372549, alpha: 1), #colorLiteral(red: 0.8235294118, green: 0.9647058824, blue: 0.7725490196, alpha: 1), #colorLiteral(red: 0.6, green: 0.9529411765, blue: 0.7411764706, alpha: 1), #colorLiteral(red: 0.1568627451, green: 0.8745098039, blue: 0.6, alpha: 1)])).done()
        a.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        
        let b = LinearView()
        b.layout(.horizontal).views(map([#colorLiteral(red: 0.9803921569, green: 0.9529411765, blue: 0.8666666667, alpha: 1), #colorLiteral(red: 0.7843137255, green: 0.8352941176, blue: 0.7254901961, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7529411765, blue: 0.662745098, alpha: 1), #colorLiteral(red: 0.4078431373, green: 0.6901960784, blue: 0.6705882353, alpha: 1)])).done()
        b.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        
        let c = LinearView()
        c.layout(.horizontal).views(map([#colorLiteral(red: 0.9882352941, green: 0.7960784314, blue: 0.7960784314, alpha: 1), #colorLiteral(red: 0.8509803922, green: 0.6784313725, blue: 0.6784313725, alpha: 1), #colorLiteral(red: 0.6784313725, green: 0.6156862745, blue: 0.6156862745, alpha: 1), #colorLiteral(red: 0.5137254902, green: 0.5137254902, blue: 0.5137254902, alpha: 1)])).done()
        c.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        
        linearView.layout(.vertical)
        .view(a)
        .view(b)
        .view(c)
        .done()
    }
}
