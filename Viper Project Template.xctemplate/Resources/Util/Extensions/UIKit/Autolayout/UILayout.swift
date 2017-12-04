//
//  Layout.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit


// MARK: VIEW MANUPULAITION WITH RESPECT TO SISTER VIEWS

public extension UIView {
    
    // Alignments
    func _setLeftAlignWith(view: UIView, offset: CGFloat = 0.0) {
        // Leading will be same
        _setAttribute(attribute: .leading, toView: view, targetAttribute: .leading, constant: offset)
    }
    func _setRightAlignWith(view: UIView, offset: CGFloat = 0.0) {
        // Trailings will be same
        _setAttribute(attribute: .trailing, toView: view, targetAttribute: .trailing, constant: offset)
    }
    func _setTopAlignWith(view: UIView, offset: CGFloat = 0.0) {
        // Top will be same
        _setAttribute(attribute: .top, toView: view, targetAttribute: .top, constant: offset)
    }
    func _setBottomAlignWith(view: UIView, offset: CGFloat = 0.0) {
        //Bottom will be same
        _setAttribute(attribute: .bottom, toView: view, targetAttribute: .bottom, constant: offset)
    }
    func _setCenterXAlignWith(view: UIView, offset: CGFloat = 0.0) {
        _setAttribute(attribute: .centerX, toView: view, targetAttribute: .centerX, constant: offset)
    }
    func _setCenterYAlignWith(view: UIView, offset: CGFloat = 0.0) {
        _setAttribute(attribute: .centerY, toView: view, targetAttribute: .centerY, constant: offset)
    }
    func _setCenterAlignWith(view: UIView, offset: CGPoint = CGPoint(x: 0.0, y: 0.0)) {
        _setCenterXAlignWith(view: view, offset: offset.x)
        _setCenterYAlignWith(view: view, offset: offset.y)
    }
    
    
    // Positioning
    func _setLeadingFromRightEdgeOf(view: UIView, offset: CGFloat = 8.0) {
        _setAttribute(attribute: .leading, toView: view, targetAttribute: .trailing, constant: offset)
    }
    func _setTrailingFromLeftEdgeOf(view: UIView, offset: CGFloat = 8.0) {
        _setAttribute(attribute: .trailing, toView: view, targetAttribute: .leading, constant: offset)
    }

    func _setTopFromBottomEdgeOf(view: UIView, offset: CGFloat = 8.0) {
        _setAttribute(attribute: .top, toView: view, targetAttribute: .bottom, constant: offset)
    }
    
    func _setBottomFromTopEdgeOf(view: UIView, offset: CGFloat = 8.0) {
        _setAttribute(attribute: .bottom, toView: view, targetAttribute: .top, constant: offset)
    }
    
    // Size
    func _setWidthEqualTo(view: UIView, offset: CGFloat = 0.0) {
        _setAttribute(attribute: .width, toView: view, targetAttribute: .width, constant: offset)
    }
    func _setHeightEqualTo(view: UIView, offset: CGFloat = 0.0) {
        _setAttribute(attribute: .height, toView: view, targetAttribute: .height, constant: offset)
    }
    func _setSizeEqualTo(view: UIView, offset: CGPoint = CGPoint(x:0.0, y: 0.0)) {
        _setWidthEqualTo(view: view, offset: offset.x)
        _setHeightEqualTo(view: view, offset: offset.y)
    }

}



// MARK: VIEW MANUPULAITION WITH RESPECT TO ONE'S SUPER VIEW
public extension UIView {
    
    
    func _setTop(topPadding: CGFloat) {
        let contraint = constraintFor(attribute: .top, toView: superview,
                                           toAttribute: .top, constraint: topPadding)
        superview?.addConstraint(contraint)

    }
    func _setLeft(sidePadding: CGFloat) {
        let contraint = constraintFor(attribute: .left, toView: superview,
                                           toAttribute: .left, constraint: sidePadding)
        superview?.addConstraint(contraint)
        
    }
    // Fixed Width
    func _setWidth(width: CGFloat) {
        let widthContraint = constraintFor(attribute: .width, toView: nil,
                                           toAttribute: .notAnAttribute, constraint: width)
        superview?.addConstraint(widthContraint)
    }
    func _setWidth(sidePadding: CGFloat) {
        _setAttribute(attribute: .leading, padding: sidePadding)
        _setAttribute(attribute: .trailing, padding: -sidePadding)
    }
    func _setHeight(verticalPadding: CGFloat) {
        _setAttribute(attribute: .top, padding: verticalPadding)
        _setAttribute(attribute: .bottom, padding: -verticalPadding)
    }
    // Fixed Height
    func _setHeight(height: CGFloat) {
        let heightConstraint = constraintFor(attribute: .height, toView: nil,
                                             toAttribute: .notAnAttribute, constraint: height)
        superview?.addConstraint(heightConstraint)
    }
    // Fixed Size
    func _setSize(size: CGSize?) {
        guard let size = size else {
            // Going to return assuming size has been set
            return
        }
        _setWidth(width: size.width)
        _setHeight(height: size.height)
    }
    
    // Equal Size
    func _setEqualWidth() {
        let widthContraint = constraintFor(attribute: .width, toView: superview,
                                           toAttribute: .width, constraint: 0.0)
        superview?.addConstraint(widthContraint)
    }
    // Fixed Height
    func _setEqualHeight() {
        let heightConstraint = constraintFor(attribute: .height, toView: superview,
                                             toAttribute: .height, constraint: 0.0)
        superview?.addConstraint(heightConstraint)
    }
    // Fixed Size
    func _setEqualSize() {
        _setEqualWidth()
        _setEqualHeight()
    }
    

    //
    func _layoutWith(size: CGSize?, topLeftOffset: CGPoint) {
        
        _setSize(size: size)
        
        // Leading constraint
        _setAttribute(attribute: .leading, padding: topLeftOffset.x)
        // Top Contraint
        _setAttribute(attribute: .top, padding: topLeftOffset.y)
    }
    
    func _layoutWith(size: CGSize?, topRightOffset: CGPoint) {
        
        _setSize(size: size)
        
        // Trailting constraint
        _setAttribute(attribute: .trailing, padding: -topRightOffset.x)
        // Top Contraint
        _setAttribute(attribute: .top, padding: topRightOffset.y)
    }
    func _layoutWith(size: CGSize?, bottomLeftOffset: CGPoint) {
        _setSize(size: size)
        
        // Leading constraint
        _setAttribute(attribute: .leading, padding: bottomLeftOffset.x)
        // Bottom Contraint
        _setAttribute(attribute: .bottom, padding: -bottomLeftOffset.y)
    }
    
    func _layoutWith(size: CGSize?, bottomRightOffset: CGPoint) {
        
        _setSize(size: size)
        
        // Trailting constraint
        _setAttribute(attribute: .trailing, padding: -bottomRightOffset.x)
        // Bottom Contraint
        _setAttribute(attribute: .bottom, padding: -bottomRightOffset.y)
    }
    func _layoutWith(size: CGSize?, centerOffset: CGPoint) {
        
        _setSize(size: size)
        
        // CenterX constraint
        _setAttribute(attribute: .centerX, padding: centerOffset.x)
        // CenterY Contraint
        _setAttribute(attribute: .centerY, padding: centerOffset.y)
    }
    
    // Helper for laying out in super view
    func _setAttribute(attribute: NSLayoutAttribute, padding: CGFloat) {
        let paddingConstraint = constraintFor(attribute: attribute, toView: superview, toAttribute: attribute, constraint: padding)
        superview?.addConstraint(paddingConstraint)
    }
    // Helper in laying out wrt another View
    func _setAttribute(attribute: NSLayoutAttribute, toView: UIView,
                       targetAttribute: NSLayoutAttribute, constant: CGFloat = 0.0) {
        
        let paddingConstraint = constraintFor(attribute: attribute, toView: toView, toAttribute: targetAttribute, constraint: constant)
        superview?.addConstraint(paddingConstraint)

    }
    
    func _layoutInSuper(margin: CGFloat){
        _layoutInSuper(edgeInset: UIEdgeInsets(margin: margin))
    }
    func _layoutInSuper(percentage: CGFloat) {
        guard let parent = self.superview else {
            debugPrint("Error: Super view not found, can not layout")
            return
        }
        
        let multiplier = percentage / 100.0
        // Center X
        let centerXContraint = constraintFor(attribute: .centerX, toView: parent, toAttribute: .centerX)
        // Center Y
        let centerYContraint = constraintFor(attribute: .centerY, toView: parent, toAttribute: .centerY)

        // Width
        let widthConstraint = constraintFor(attribute: .width, toView: parent, toAttribute: .width, multiplier: multiplier)
        // Height
        let heightConstraint = constraintFor(attribute: .height, toView: parent, toAttribute: .height, multiplier: multiplier)
        
        parent.addConstraints([centerXContraint, centerYContraint,
                               widthConstraint, heightConstraint])
    }
    
    func _layoutInSuper(edgeInset: UIEdgeInsets) {
        
        guard let parent = self.superview else {
            debugPrint("Error: Super view not found, can not layout")
            return
        }
        // Adding Leading Constant
        let leadingConstraint = constraintFor(attribute: .leading, toView: parent, toAttribute: .leading, constraint: edgeInset.left)
        
        // Adding Trailing Constant
        let trailingConstraint = constraintFor(attribute: .trailing, toView: parent, toAttribute: .trailing, constraint: -edgeInset.right)
        
        // Adding Top Constant
        let topConstraint = constraintFor(attribute: .top, toView: parent, toAttribute: .top, constraint: edgeInset.top)

        // Adding Bottom Constant
        let bottomConstraint = constraintFor(attribute: .bottom, toView: parent, toAttribute: .bottom, constraint: -edgeInset.bottom)

        parent.addConstraints([leadingConstraint, trailingConstraint,
                             topConstraint, bottomConstraint])

    }
    
    // MARK: HELPER
    func constraintFor(attribute: NSLayoutAttribute,
                               relatedBy: NSLayoutRelation = .equal,
                               toView: UIView?, toAttribute: NSLayoutAttribute,
                               multiplier: CGFloat = 1.0, constraint: CGFloat = 0.0) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: self,
                                  attribute: attribute,
                                  relatedBy: relatedBy,
                                  toItem: toView,
                                  attribute: toAttribute,
                                  multiplier: multiplier,
                                  constant: constraint)
        
    }
}
