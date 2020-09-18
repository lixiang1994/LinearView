//
//  LinearLayout.swift
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

public class LinearLayout {
    var changed: (() -> Void)?
    
    let axis: NSLayoutConstraint.Axis
    var views: [() -> View] = []
    var spaces: [Int: CGFloat] = [:]
    
    /// Initialization function
    /// - Parameter axis: A stack with a horizontal axis is a row of arrangedSubviews, and a stack with a vertical axis is a column of arrangedSubviews.
    public init(_ axis: NSLayoutConstraint.Axis = .vertical) {
        self.axis = axis
    }
    
    @discardableResult
    public func view(_ value: UIView) -> Self {
        return view(.init(value, layout: .automatic(leading: 0, trailing: 0)))
    }
    
    @discardableResult
    public func view(_ value: View) -> Self {
        return view { value }
    }
    
    @discardableResult
    public func views(_ value: [UIView]) -> Self {
        value.forEach { view($0) }
        return self
    }
    
    @discardableResult
    public func views(_ value: [View]) -> Self {
        value.forEach { view($0) }
        return self
    }
    
    @discardableResult
    public func view(_ closure: @escaping () -> View) -> Self {
        views.append(closure)
        return self
    }
    
    /// Spacing between adjacent edges of arrangedSubviews.
    /// Used as a minimum spacing for the fixed size.
    /// Use negative values to allow overlap.
    ///
    /// - Parameter value: spacing
    /// - Returns: LinearLayout
    @discardableResult
    public func spacing(_ value: CGFloat) -> Self {
        let key = views.count - 1
        if let temp = spaces[key] {
            spaces[key] = temp + value
            
        } else {
            spaces[key] = value
        }
        return self
    }
    
    @discardableResult
    public func finish() -> Self {
        changed?()
        return self
    }
}

public struct Alignment {
    
    let value: Int
    var offset: CGFloat?
    
    /// Center the items in a vertical stack horizontally or the items in a horizontal stack vertically
    public static var center: Alignment = .init(value: 0)
    /// Align the leading edges of vertically stacked items or the top edges of horizontally stacked items tightly to the relevant edge of the container
    public static var leading: Alignment = .init(value: 1)
    /// Align the trailing edges of vertically stacked items or the bottom edges of horizontally stacked items tightly to the relevant edge of the container
    public static var trailing: Alignment = .init(value: 2)
    
    /// Center the items in a vertical stack horizontally or the items in a horizontal stack vertically
    /// - Parameter offset: Center offset
    /// - Returns: Alignment
    public static func center(_ offset: CGFloat) -> Alignment {
        var temp = center
        temp.offset = offset
        return temp
    }
    
    /// Align the leading edges of vertically stacked items or the top edges of horizontally stacked items tightly to the relevant edge of the container
    /// - Parameter inset: padding
    /// - Returns: Alignment
    public static func leading(_ inset: CGFloat) -> Alignment {
        var temp = leading
        temp.offset = inset
        return temp
    }
    
    /// Align the trailing edges of vertically stacked items or the bottom edges of horizontally stacked items tightly to the relevant edge of the container
    /// - Parameter inset: padding
    /// - Returns: Alignment
    public static func trailing(_ inset: CGFloat) -> Alignment {
        var temp = trailing
        temp.offset = inset
        return temp
    }
}

public enum Layout {
    /// The width of the vertically stacked items or the height of the horizontally stacked items and the alignment of the items.
    case constant(CGFloat, Alignment)
    /// Align the leading trailing edges of vertically stacked items or the top bottom edges of horizontally stacked items tightly to the relevant edge of the container
    case automatic(leading: CGFloat, trailing: CGFloat)
}

public class View {
    let view: UIView
    let layout: Layout
    
    public init(_ view: UIView, layout: Layout = .automatic(leading: 0, trailing: 0)) {
        self.view = view
        self.layout = layout
    }
}
