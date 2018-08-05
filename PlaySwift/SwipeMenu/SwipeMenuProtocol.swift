//
//  SwipeMenuProtocol.swift
//  PlaySwift
//
//  https://github.com/yysskk/SwipeMenuViewController
//

import UIKit

// MARK: - SwipeMenuViewDelegate
protocol SwipeMenuViewDelegate: class {
    /// Called before setup self.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int)
    /// Called after setup self.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int)
    /// Called before swiping the page.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int)
    /// Called after swiping the page.
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int)
}

extension SwipeMenuViewDelegate {
    public func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) { }
    public func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) { }
    public func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) { }
    public func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) { }
}

protocol SwipeMenuViewDataSource: class {
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> GlobalViewController
}
