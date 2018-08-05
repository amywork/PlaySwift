//
//  SwipeMenuViewController.swift
//  PlaySwift
//
//  Created by Kimkeeyun on 05/08/2018.
//  Copyright © 2018 com.amy. All rights reserved.
//

import UIKit
import Foundation

class SwipeMenuViewController: GlobalViewController, SwipeMenuViewDelegate, SwipeMenuViewDataSource {
    
    var swipeMenuView: SwipeMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeMenuView = SwipeMenuView(frame: view.frame)
        swipeMenuView.delegate = self
        swipeMenuView.dataSource = self
        view.addSubview(swipeMenuView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        // swipeMenuView.willChangeOrientation()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSwipeMenuViewConstraints()
    }
    
    private func addSwipeMenuViewConstraints() {
        swipeMenuView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) /*, view.hasSafeAreaInsets, swipeMenuView.options.tabView.isSafeAreaEnabled*/ {
            NSLayoutConstraint.activate([
                swipeMenuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                swipeMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                swipeMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                swipeMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                swipeMenuView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor),
                swipeMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                swipeMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                swipeMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
        }
    }
    
    // MARK: - SwipeMenuViewDelegate
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) { }
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) { }
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) { }
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) { }
    
    // MARK: - SwipeMenuViewDataSource
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return children.count
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return children[index].title ?? ""
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> GlobalViewController {
        let vc = children[index]
        vc.didMove(toParent: self)
        return vc as! GlobalViewController
    }
}
