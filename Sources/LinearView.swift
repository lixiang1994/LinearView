//
//  LinearView.swift
//  ┌─┐      ┌───────┐ ┌───────┐
//  │ │      │ ┌─────┘ │ ┌─────┘
//  │ │      │ └─────┐ │ └─────┐
//  │ │      │ ┌─────┘ │ ┌─────┘
//  │ └─────┐│ └─────┐ │ └─────┐
//  └───────┘└───────┘ └───────┘
//
//  Created by Lee on 2020/9/17.
//  Copyright © 2020 LEE. All rights reserved.
//

import UIKit

public class LinearView: UIView {
    
    private var layout: LinearLayout = .init() {
        didSet { update(layout) }
    }
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
        
        update(layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupLayout()
        
        update(layout)
    }
    
    private func setup() {
        backgroundColor = .clear
        stackView.backgroundColor = .clear
        stackView.spacing = 0
        addSubview(stackView)
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints([
            .init(
                item: self,
                attribute: .top,
                relatedBy: .equal,
                toItem: stackView,
                attribute: .top,
                multiplier: 1,
                constant: 0
            ),
            .init(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: stackView,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
            ),
            .init(
                item: self,
                attribute: .leading,
                relatedBy: .equal,
                toItem: stackView,
                attribute: .leading,
                multiplier: 1,
                constant: 0
            ),
            .init(
                item: self,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: stackView,
                attribute: .trailing,
                multiplier: 1,
                constant: 0
            )
        ])
        layoutIfNeeded()
    }
    
    private func update(_ layout: LinearLayout) {
        layout.changed = { [weak self] in
            self?.update(layout)
        }
        
        // 移除原有子视图
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        stackView.axis = layout.axis
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        /// 设置起始间距
        spacing(layout.spaces[-1])
        
        // 设置子视图
        for (index, view) in layout.views.enumerated() {
                        
            let view = view()
            let wrapper = UIView()
            wrapper.backgroundColor = .clear
            wrapper.addSubview(view.view)
            
            view.view.translatesAutoresizingMaskIntoConstraints = false
            wrapper.translatesAutoresizingMaskIntoConstraints = false
            
            switch layout.axis {
            case .vertical:
                switch view.layout {
                case let .constant(value, alignment):
                    let constraint = NSLayoutConstraint(
                        item: view.view,
                        attribute: .width,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .width,
                        multiplier: 1,
                        constant: value
                    )
                    constraint.priority = .init(rawValue: 999)
                    constraint.identifier = "StackView"
                    view.view.addConstraint(constraint)
                    
                    switch alignment.value {
                    case 0:
                        wrapper.addConstraint(
                            .init(
                                item: wrapper,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view.view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: -(alignment.offset ?? 0)
                            )
                        )
                        
                    case 1:
                        wrapper.addConstraint(
                            .init(
                                item: wrapper,
                                attribute: .leading,
                                relatedBy: .equal,
                                toItem: view.view,
                                attribute: .leading,
                                multiplier: 1,
                                constant: -(alignment.offset ?? 0)
                            )
                        )
                        
                    case 2:
                        wrapper.addConstraint(
                            .init(
                                item: wrapper,
                                attribute: .trailing,
                                relatedBy: .equal,
                                toItem: view.view,
                                attribute: .trailing,
                                multiplier: 1,
                                constant: alignment.offset ?? 0
                            )
                        )
                        
                    default:
                        continue
                    }
                    
                case let .automatic(leading, trailing):
                    wrapper.addConstraints([
                        .init(
                            item: wrapper,
                            attribute: .leading,
                            relatedBy: .equal,
                            toItem: view.view,
                            attribute: .leading,
                            multiplier: 1,
                            constant: -leading
                        ),
                        .init(
                            item: wrapper,
                            attribute: .trailing,
                            relatedBy: .equal,
                            toItem: view.view,
                            attribute: .trailing,
                            multiplier: 1,
                            constant: trailing
                        )
                    ])
                }
                
                wrapper.addConstraints([
                    .init(
                        item: wrapper,
                        attribute: .top,
                        relatedBy: .equal,
                        toItem: view.view,
                        attribute: .top,
                        multiplier: 1,
                        constant: 0
                    ),
                    .init(
                        item: wrapper,
                        attribute: .bottom,
                        relatedBy: .equal,
                        toItem: view.view,
                        attribute: .bottom,
                        multiplier: 1,
                        constant: 0
                    )
                ])
                
            case .horizontal:
                switch view.layout {
                case let .constant(value, alignment):
                    let constraint = NSLayoutConstraint(
                        item: view.view,
                        attribute: .height,
                        relatedBy: .equal,
                        toItem: nil,
                        attribute: .height,
                        multiplier: 1,
                        constant: value
                    )
                    constraint.priority = .init(rawValue: 999)
                    constraint.identifier = "StackView"
                    view.view.addConstraint(constraint)
                    
                    switch alignment.value {
                    case 0:
                        wrapper.addConstraint(
                            .init(
                                item: wrapper,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: view.view,
                                attribute: .centerY,
                                multiplier: 1,
                                constant: -(alignment.offset ?? 0)
                            )
                        )
                        
                    case 1:
                        wrapper.addConstraint(
                            .init(
                                item: wrapper,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: view.view,
                                attribute: .top,
                                multiplier: 1,
                                constant: -(alignment.offset ?? 0)
                            )
                        )
                        
                    case 2:
                        wrapper.addConstraint(
                            .init(
                                item: wrapper,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.view,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: alignment.offset ?? 0
                            )
                        )
                        
                    default:
                        continue
                    }
                    
                case let .automatic(leading, trailing):
                    wrapper.addConstraints([
                        .init(
                            item: wrapper,
                            attribute: .top,
                            relatedBy: .equal,
                            toItem: view.view,
                            attribute: .top,
                            multiplier: 1,
                            constant: -leading
                        ),
                        .init(
                            item: wrapper,
                            attribute: .bottom,
                            relatedBy: .equal,
                            toItem: view.view,
                            attribute: .bottom,
                            multiplier: 1,
                            constant: trailing
                        )
                    ])
                }
                
                wrapper.addConstraints([
                    .init(
                        item: wrapper,
                        attribute: .leading,
                        relatedBy: .equal,
                        toItem: view.view,
                        attribute: .leading,
                        multiplier: 1,
                        constant: 0
                    ),
                    .init(
                        item: wrapper,
                        attribute: .trailing,
                        relatedBy: .equal,
                        toItem: view.view,
                        attribute: .trailing,
                        multiplier: 1,
                        constant: 0
                    )
                ])
                
            @unknown default:
                break
            }
            
            stackView.addArrangedSubview(wrapper)
            
            /// 设置间距视图
            spacing(layout.spaces[index])
        }
    }
    
    private func spacing(_ value: CGFloat?) {
        guard let value = value else {
            return
        }
        
        let wrapper = UIView()
        wrapper.backgroundColor = .clear
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        
        switch layout.axis {
        case .vertical:
            wrapper.addConstraint(
                .init(
                    item: wrapper,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .height,
                    multiplier: 1,
                    constant: value
                )
            )
            
        case .horizontal:
            wrapper.addConstraint(
                .init(
                    item: wrapper,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .width,
                    multiplier: 1,
                    constant: value
                )
            )
            
        @unknown default:
            break
        }
        
        stackView.addArrangedSubview(wrapper)
    }
}

extension LinearView {
    
    /// Layout configuration
    /// - Parameter axis: A stack with a horizontal axis is a row of arrangedSubviews, and a stack with a vertical axis is a column of arrangedSubviews.
    /// - Returns: LinearLayout
    public func layout(_ axis: NSLayoutConstraint.Axis = .vertical) -> LinearLayout {
        layout = .init(axis)
        return layout
    }
}
