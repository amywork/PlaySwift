//
//  SwipeViewController.swift
//  PlaySwift
//
//

import UIKit
import Foundation

class SwipeViewController: SwipeMenuViewController {
    
    private var datas: [String] = ["Great","Nice", "Happy", "Pleasure", "Goody"]
    
    override func viewDidLoad() {
        datas.forEach { (string) in
            let vc = ContentViewController()
            vc.title = string
            vc.content = string
            self.addChild(vc)
        }
        super.viewDidLoad()
    }
    
    // MARK: - SwipeMenuViewDelegate
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
        print("will setup SwipeMenuView")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
        print("did setup SwipeMenuView")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    
    // MARK - SwipeMenuViewDataSource
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return datas.count
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return children[index].title ?? ""
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> GlobalViewController {
        let vc = children[index]
        vc.didMove(toParent: self)
        return vc as! GlobalViewController
    }
}
