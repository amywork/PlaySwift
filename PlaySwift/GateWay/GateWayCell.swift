//
//  GateWayCell.swift
//  PlaySwift
//
//  Created by Kimkeeyun on 04/08/2018.
//  Copyright © 2018 com.amy. All rights reserved.
//

import UIKit
import Foundation

class GateWayCell: GlobalCollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var eventClosure: (() -> ())?
    
    @IBAction func on(_ sender: UIButton) {
        eventClosure?()
    }
 
    override func configure(_ data: Any?) {
        
    }
}

