//
//  HorizontalVerticalViewController.swift
//  Demo
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 Lee. All rights reserved.
//

import UIKit
import SnapKit
import LinearView

class HorizontalVerticalViewController: UIViewController {
    
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
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    private func setupViews() {
        func map(_ colors: [UIColor]) -> [UIView] {
            return colors.enumerated().map { (index, color) -> UIView in
                let view = UIView()
                view.backgroundColor = color
                
                view.snp.makeConstraints { (make) in
                    make.height.equalTo(20 * (index + 1))
                }
                return view
            }
        }
        
        let a = LinearView()
        a.layout(.vertical).views(map([#colorLiteral(red: 0.5254901961, green: 0.4588235294, blue: 0.662745098, alpha: 1), #colorLiteral(red: 0.7647058824, green: 0.6823529412, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.937254902, green: 0.7333333333, blue: 0.8117647059, alpha: 1), #colorLiteral(red: 1, green: 0.8352941176, blue: 0.8039215686, alpha: 1)])).finish()
        a.snp.makeConstraints { (make) in
            make.width.equalTo(60)
        }
        
        let b = LinearView()
        b.layout(.vertical).views(map([#colorLiteral(red: 0.9803921569, green: 0.9529411765, blue: 0.8666666667, alpha: 1), #colorLiteral(red: 0.7843137255, green: 0.8352941176, blue: 0.7254901961, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.7529411765, blue: 0.662745098, alpha: 1), #colorLiteral(red: 0.4078431373, green: 0.6901960784, blue: 0.6705882353, alpha: 1)])).finish()
        b.snp.makeConstraints { (make) in
            make.width.equalTo(60)
        }
        
        let c = LinearView()
        c.layout(.vertical).views(map([#colorLiteral(red: 0.2235294118, green: 0.231372549, blue: 0.2666666667, alpha: 1), #colorLiteral(red: 0.5529411765, green: 0.5764705882, blue: 0.6705882353, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.8784313725, blue: 0.9411764706, alpha: 1), #colorLiteral(red: 0.9450980392, green: 0.9529411765, blue: 0.9725490196, alpha: 1)])).finish()
        c.snp.makeConstraints { (make) in
            make.width.equalTo(60)
        }
        
        linearView.layout(.horizontal)
        .view(a)
        .view(b)
        .view(c)
        .finish()
    }
}
