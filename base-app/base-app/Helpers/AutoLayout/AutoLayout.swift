//
//  AutoLayout.swift
//  base-app
//
//  Created by Erick Kaique Da Silva on 20/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

public enum NSLayoutConstraintType {
    case equal
    case greaterThanOrEqual
    case lessThanOrEqual
    
    func get() -> NSLayoutConstraint.Relation {
        switch self {
        case .equal:
            return NSLayoutConstraint.Relation.equal
        case .greaterThanOrEqual:
            return NSLayoutConstraint.Relation.greaterThanOrEqual
        case .lessThanOrEqual:
            return NSLayoutConstraint.Relation.lessThanOrEqual
        }
    }
}

extension NSLayoutConstraint {
    
    static func inset(view: UIView, inSuperview superView: UIView,
                      withInset inset: UIEdgeInsets? =  nil) -> [NSLayoutConstraint] {
        return [.top(firstView: superView, secondView: view, relation: .equal, constant: -Float(inset?.top ?? 0) ),
                .left(firstView: superView, secondView: view, relation: .equal, constant: -Float(inset?.left ?? 0) ),
                .right(firstView: superView, secondView: view, relation: .equal, constant: -Float(inset?.right ?? 0) ),
                .bottom(firstView: superView, secondView: view, relation: .equal, constant: -Float(inset?.bottom ?? 0) )]
    }
    
    // SETUP COSNTRAINT TOP
    static func top(firstView: UIView,
                    secondView: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.top,
                                  relatedBy: relation.get(), toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.top, multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    // SETUP COSNTRAINT LEFT
    static func left(firstView: UIView, secondView: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.left,
                                  relatedBy: relation.get(), toItem: secondView, attribute: NSLayoutConstraint.Attribute.left,
                                  multiplier: 1, constant: CGFloat(constant))
    }
    
    // SETUP COSNTRAINT RIGHT
    static func right(firstView: UIView, secondView: UIView,
                      relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.right,
                                  relatedBy: relation.get(),
                                  toItem: secondView, attribute: NSLayoutConstraint.Attribute.right,
                                  multiplier: 1, constant: CGFloat(constant))
    }
    
    // SETUP COSNTRAINT BOTTOM
    static func bottom(firstView: UIView, secondView: UIView,
                       relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.bottom,
                                  relatedBy: relation.get(), toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1,
                                  constant: CGFloat(constant))
    }
    
    // SETUP COSNTRAINT BASELINE
    static func baseLine(firstView: UIView, secondView: UIView,
                         relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                  relatedBy: relation.get(), toItem: secondView, attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                  multiplier: 1, constant: CGFloat(constant))
    }
    
    // SETUP COSNTRAINT OVER
    static func over(topItem: UIView, bottomItem: UIView,
                     relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: topItem, attribute: NSLayoutConstraint.Attribute.bottom,
                                  relatedBy: relation.get(), toItem: bottomItem, attribute: NSLayoutConstraint.Attribute.top,
                                  multiplier: 1, constant: -1 * CGFloat(constant))
    }
    
    // SETUP COSNTRAINT ASIDE
    static func aside(left: UIView, right: UIView,
                      relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: left, attribute: NSLayoutConstraint.Attribute.right,
                                  relatedBy: relation.get(), toItem: right, attribute: NSLayoutConstraint.Attribute.left,
                                  multiplier: 1, constant: -1 * CGFloat(constant))
    }
    
    // SETUP COSNTRAINT HEIGHT
    static func height(firstView: UIView, secondeView: UIView,
                       relation: NSLayoutConstraintType = .equal, constant: Float = 0, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(), toItem: secondeView,
                                  attribute: NSLayoutConstraint.Attribute.height, multiplier: multiplier, constant: CGFloat(constant))
    }
    
    static func height(view: UIView, relation: NSLayoutConstraintType = .equal, constant: Float) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.height,
                                  relatedBy: relation.get(), toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1, constant: CGFloat(constant))
    }
    
    // SETUP COSNTRAINT WIDTH
    static func width(firstView: UIView, secondView: UIView,
                      relation: NSLayoutConstraintType = .equal, constant: Float,
                      multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(), toItem: secondView,
                                  attribute: NSLayoutConstraint.Attribute.width, multiplier: multiplier, constant: CGFloat(constant))
    }
    
    static func width(view: UIView, relation: NSLayoutConstraintType = .equal, constant: Float) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(), toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                  multiplier: 1, constant: CGFloat(constant))
    }
    
    static func aspectRatio(view: UIView, relation: NSLayoutConstraintType = .equal, constant: Float) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.width,
                                  relatedBy: relation.get(), toItem: view, attribute: NSLayoutConstraint.Attribute.height,
                                  multiplier: CGFloat(constant), constant: 0)
    }
    
    static func centerY(firstView: UIView, secondView: UIView,
                        attribute: NSLayoutConstraint.Attribute = .centerY,
                        relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.centerY,
                                  relatedBy: relation.get(), toItem: secondView, attribute: attribute, multiplier: 1, constant: CGFloat(constant))
    }
    
    static func centerX(firstView: UIView, secondView: UIView,
                        relation: NSLayoutConstraintType = .equal, constant: Float = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView, attribute: NSLayoutConstraint.Attribute.centerX,
                                  relatedBy: relation.get(), toItem: secondView, attribute: NSLayoutConstraint.Attribute.centerX,
                                  multiplier: 1, constant: CGFloat(constant))
    }
}

public extension Array where Element == NSLayoutConstraint {
    
    func activate() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
    
}

public extension UIView {
    var layout: AutoLayout {
        AutoLayout(view: self)
    }
}

public class AutoLayout {
    
    let view: UIView
    
    public var height: NSLayoutDimension {
        return view.heightAnchor
    }
    
    public var widht: NSLayoutDimension {
        return view.widthAnchor
    }
    
    init(view: UIView) {
        self.view = view
    }
    
    public func applyConstraint(_ block: ((AutoLayout) -> Void)) {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(self)
    }
    
    public func edges(in superView: UIView, with offSet: UIEdgeInsets? = nil) {
        let constraints = NSLayoutConstraint.inset(view: self.view,
                                                   inSuperview: superView,
                                                   withInset: offSet)
        
        constraints.activate()
    }
    
    public func edges(in superView: UIView, offSet: CGFloat,
                      priority: UILayoutPriority = .required) {
        let inset = UIEdgeInsets(top: offSet, left: offSet, bottom: offSet, right: offSet)
        let constraints = NSLayoutConstraint.inset(view: self.view, inSuperview: superView, withInset: inset)
        
        constraints.forEach { $0.priority = priority }
        constraints.activate()
    }
    
    @discardableResult
    
    public func top(alignedWith view: UIView,
                    relation: NSLayoutConstraintType = .equal,
                    offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.top(firstView: self.view,
                                                secondView: view,
                                                relation: relation,
                                                constant: offSet)
        
        constraint.isActive = true
        return constraint
        
    }
    
    @discardableResult
    
    public func left(alignedWith view: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.left(firstView: self.view,
                                                 secondView: view,
                                                 relation: relation,
                                                 constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func right(alignedWith view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.right(firstView: self.view,
                                                  secondView: view,
                                                  relation: relation,
                                                  constant: -offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func bottom(alignedWith view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       offSet: Float = 0,
                       priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.bottom(firstView: self.view,
                                                   secondView: view,
                                                   relation: relation,
                                                   constant: -offSet)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func baseLine(alignedWith view: UIView,
                         relation: NSLayoutConstraintType = .equal,
                         offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.baseLine(firstView: self.view,
                                                     secondView: view,
                                                     relation: relation,
                                                     constant: -offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func under(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.over(topItem: view,
                                                 bottomItem: self.view,
                                                 relation: relation,
                                                 constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func above(view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0,
                      priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.over(topItem: self.view,
                                                 bottomItem: view,
                                                 relation: relation,
                                                 constant: offSet)
        constraint.priority = priority
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    
    public func right(of view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.aside(left: view,
                                                  right: self.view,
                                                  relation: relation,
                                                  constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func left(of view: UIView, relation: NSLayoutConstraintType = .equal, offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.aside(left: self.view,
                                                  right: view,
                                                  relation: relation,
                                                  constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func height(relatedTo view: UIView,
                       relation: NSLayoutConstraintType = .equal,
                       priority: UILayoutPriority = .required,
                       multiplier: CGFloat = 1, _ size: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.height(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult

    public func height(relation: NSLayoutConstraintType = .equal,
                       priority: UILayoutPriority = .required,
                       _ size: Float) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.height(view: self.view,
                                                   relation: relation,
                                                   constant: size)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func height(equalTo dimension: NSLayoutDimension,
                       priority: UILayoutPriority = .required,
                       multiplier: Float = 1,
                       _ size: Float = 0) -> NSLayoutConstraint {
        // ARRUMAR
        return NSLayoutConstraint()
    }
    
    @discardableResult
    
    public func width(relatedTo view: UIView,
                      relation: NSLayoutConstraintType = .equal,
                      multiplier: CGFloat = 1,
                      _ size: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.width(firstView: self.view,
                                                  secondView: view,
                                                  relation: relation,
                                                  constant: size,
                                                  multiplier: multiplier)
        
        constraint.isActive = true
        return constraint
        
    }
    
    @discardableResult
    
    public func width(relation: NSLayoutConstraintType = .equal,
                      _ size: Float) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint.width(view: self.view,
                                                  relation: relation,
                                                  constant: size)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func width(equalTo dimension: NSLayoutDimension,
                      priority: UILayoutPriority = .required,
                      multiplier: Float = 1,
                      _ size: Float = 0) -> NSLayoutConstraint {
        // ARRUMAR
        return NSLayoutConstraint()
    }
    
    
    public func size(relation: NSLayoutConstraintType = .equal, _ size: Float) {
        width(relation: relation, size)
        height(relation: relation, size)
    }
    
    @discardableResult
    
    public func verticalCenter(view: UIView,
                               relation: NSLayoutConstraintType = .equal,
                               attribute: NSLayoutConstraint.Attribute = .centerY,
                               offSet: Float = 0) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint.centerY(firstView: self.view,
                                                    secondView: view,
                                                    attribute: attribute,
                                                    relation: relation,
                                                    constant: offSet)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func horizontalCenter(view: UIView,
                                 relation: NSLayoutConstraintType = .equal,
                                 offSet: Float = 0,
                                 priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint  = NSLayoutConstraint.centerX(firstView: self.view,
                                                     secondView: view,
                                                     relation: relation,
                                                     constant: offSet)
        
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    public func center(in view: UIView, relation: NSLayoutConstraintType = .equal, offSet: Float = 0) {
        horizontalCenter(view: view, relation: relation, offSet: offSet)
        verticalCenter(view: view, relation: relation, offSet: offSet)
    }
    
    public func size(relatedTo view: UIView,
                     relation: NSLayoutConstraintType = .equal,
                     offSet: Float = 0) {
        width(relatedTo: view, relation: relation, offSet)
        height(relatedTo: view, relation: relation, offSet)
    }
    
    @discardableResult
    
    public func topSafeArea(aligneWith: UIView,
                            relation: NSLayoutConstraintType = .equal,
                            offset: CGFloat = 0,
                            priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = self.view.topAnchor.constraint(equalTo: aligneWith.safeAreaLayoutGuide.topAnchor,
                                                        constant: offset)
        constraint.isActive = true
        constraint.priority = priority
        
        return constraint
    }
    
    @discardableResult
    
    public func bottomSafaArea(alignedWith: UIView,
                               relation: NSLayoutConstraintType = .equal,
                               offset: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        
        let constraint = self.view.bottomAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.bottomAnchor, constant: -offset)
        
        constraint.isActive = true
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult
    
    public func leftSafeArea(alinedWith: UIView,
                             relation: NSLayoutConstraintType = .equal,
                             offset: CGFloat = 0) -> NSLayoutConstraint {
       
        let constraint = self.view.leftAnchor.constraint(equalTo: alinedWith.safeAreaLayoutGuide.leftAnchor, constant: offset)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func rightSafeArea(alignedWith: UIView,
                              relation: NSLayoutConstraintType = .equal,
                              offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint = self.view.rightAnchor.constraint(equalTo: alignedWith.safeAreaLayoutGuide.rightAnchor, constant: -offset)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    
    public func aspectRatio(relation: NSLayoutConstraintType = .equal, offset: Float = 0) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.aspectRatio(view: self.view, constant: offset)
        
        constraint.isActive = true
        return constraint
    }
    
    public func removeConstraints() {
        self.view.removeConstraints(self.view.constraints)
    }
    
    public func bottomSafeArea(alignedWith: UIView, offsetForStandardLayouts offset: Float) {
        self.bottomSafaArea(alignedWith: alignedWith, priority: .defaultLow)
        self.bottom(alignedWith: alignedWith, relation: .lessThanOrEqual, offSet: offset, priority: .defaultHigh)
    }
    
    public func verticalCenterBetween(upperAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, lowerAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        let topLayoutGuide = UILayoutGuide()
        let bottomLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(topLayoutGuide)
        view.addLayoutGuide(bottomLayoutGuide)
    }
    
    @discardableResult
    private func anchor(_ dimensionKeyPath: KeyPath<UIView, NSLayoutDimension>,
                        to dimension: NSLayoutDimension,
                        priority: UILayoutPriority = .required,
                        multiplier: Float = 1,
                        _ size: Float = 0) -> NSLayoutConstraint {
        let anchor = view[keyPath: dimensionKeyPath]
        let constraint = anchor.constraint(equalTo: dimension, multiplier: CGFloat(multiplier), constant: CGFloat(size))
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

}

