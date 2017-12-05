//
//  UICollectionViewCell.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

//extension UICollectionViewCell {
//    override class var indentifire: String {
//        return "\(self)"
//    }
//    static func instantiateAsReusable(inCollectionView collectionView: UICollectionView,
//                                      at indexPath: IndexPath) -> Self {
//        return collectionView.dequeCell(cellClass: self, at: indexPath)
//    }
//}

extension UICollectionReusableView {
    class var indentifire: String {
        return "\(self)"
    }
    static func dequeue(kind: String, inCollectionView collectionView: UICollectionView,
                        at indexPath: IndexPath) -> Self {
        return collectionView.dequeResulableView(kind: kind, viewClass: self, at: indexPath)
    }
}
