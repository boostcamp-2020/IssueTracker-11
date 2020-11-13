//
//  UICollectionView+.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    public func selectAll() {
        for section in 0..<self.numberOfSections {
            for item in 0..<self.numberOfItems(inSection: section) {
                self.selectItem(at: IndexPath(item: item, section: section), animated: false, scrollPosition: [])
            }
        }
    }
    
    public func deselectAll() {
        for section in 0..<self.numberOfSections {
            for item in 0..<self.numberOfItems(inSection: section) {
                self.deselectItem(at: IndexPath(item: item, section: section), animated: false)
            }
        }
    }
    
    public func excuteAll(handler: (UICollectionViewCell) -> Void) {
        for section in 0..<self.numberOfSections {
            for item in 0..<self.numberOfItems(inSection: section) {
                guard let cell = self.cellForItem(at: IndexPath(item: item, section: section)) else { return }
                handler(cell)
            }
        }
    }
    
}
