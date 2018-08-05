//
//  ContentViewController.swift
//  PlaySwift
//
//  Created by Kimkeeyun on 05/08/2018.
//  Copyright © 2018 com.amy. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: GlobalViewController {
    
    var contentLabel: UILabel! {
        didSet {
            contentLabel.textColor = .black
            contentLabel.textAlignment = .center
            contentLabel.font = UIFont.boldSystemFont(ofSize: 25)
            contentLabel.text = content
            view.addSubview(contentLabel)
            
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
                contentLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                contentLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                contentLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                ])
        }
    }
    
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
    }
}
