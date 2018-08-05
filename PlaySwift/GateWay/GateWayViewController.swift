//
//  ViewController.swift
//  PlaySwift
//
//  Created by Kimkeeyun on 04/08/2018.
//  Copyright © 2018 com.amy. All rights reserved.
//

import UIKit

struct MetaInfo {
    var title = ""
    var desc = ""
}

class GateWayViewController: GlobalViewController {
    
    var data = [MetaInfo]()
    
    enum Section: Int {
        case header
        case body
        case footer
        case count
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(MetaInfo(title: "Swipe Menu", desc: "Copying opensource https://github.com/yysskk/SwipeMenuViewController"))
    }

}

extension GateWayViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.count.rawValue
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionKey = Section(rawValue: section) else { return 0 }
        switch sectionKey {
        case .header:
            return 0
        case .body:
            return data.count
        case .footer:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionKey = Section(rawValue: indexPath.section) else {
            return collectionView.dequeueReusableCell(UICollectionViewCell.self, for: indexPath)
        }
        switch sectionKey {
        default:
            let cell = collectionView.dequeueReusableCell(GateWayCell.self, for: indexPath)
            cell.titleLabel.text = data[indexPath.item].title
            cell.descLabel.text = data[indexPath.item].desc
            let event = {
                let swipeVC = SwipeViewController()
                self.navigationController?.pushViewController(swipeVC, animated: true)
            }
            cell.eventClosure = event
            return cell
        }
    }
}
