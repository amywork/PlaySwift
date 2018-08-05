//
//  ExtensionUICollectionView.swift
//  PlaySwift
//
//  Created by Kimkeeyun on 04/08/2018.
//  Copyright © 2018 com.amy. All rights reserved.
//
import UIKit
import Foundation

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(_ class: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}

