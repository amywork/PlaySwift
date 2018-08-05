//
//  SwipeMenuView.swift
//  PlaySwift
//
//  https://github.com/yysskk/SwipeMenuViewController
//

import UIKit
import Foundation

class SwipeMenuView: UIView {
    
    weak var delegate: SwipeMenuViewDelegate?
    weak var dataSource: SwipeMenuViewDataSource?
    
    var currentIndex: Int = 0
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setup()
    }
    
    fileprivate(set) var contentScrollView: ContentScrollView? {
        didSet {
            guard let contentScrollView = contentScrollView else { return }
            contentScrollView.delegate = self
            contentScrollView.dataSource = self
            addSubview(contentScrollView)
            layout(contentScrollView: contentScrollView)
        }
    }
    
    func layout(contentScrollView: ContentScrollView) {
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: self.topAnchor/*, constant: options.tabView.height*/),
            contentScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    // MARK: - Setup
    private func setup(default defaultIndex: Int = 0) {
        delegate?.swipeMenuView(self, viewWillSetupAt: defaultIndex)
        backgroundColor = .clear
        //tabView = TabView(frame: CGRect(x: 0, y: 0, width: frame.width, height: options.tabView.height), options: options.tabView)
        //tabView?.clipsToBounds = options.tabView.clipsToBounds
        contentScrollView = ContentScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), default: defaultIndex)
        //contentScrollView?.clipsToBounds = options.contentScrollView.clipsToBounds
        //tabView?.update(defaultIndex)
        contentScrollView?.update(defaultIndex)
        currentIndex = defaultIndex
        delegate?.swipeMenuView(self, viewDidSetupAt: defaultIndex)
    }
}

extension SwipeMenuView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= frame.width * CGFloat(currentIndex + 1) {
            update(from: currentIndex, to: currentIndex + 1)
        } else if scrollView.contentOffset.x <= frame.width * CGFloat(currentIndex - 1) {
            update(from: currentIndex, to: currentIndex - 1)
        }
        //TODO
        //updateTabViewAddition(by: scrollView)
        
    }
    
    func update(from fromIndex: Int, to toIndex: Int) {
//        if !isLayoutingSubviews {
            delegate?.swipeMenuView(self, willChangeIndexFrom: fromIndex, to: toIndex)
//        }
//
//        tabView?.update(toIndex)
        contentScrollView?.update(toIndex)
//
//        if !isJumping {
//            // delay setting currentIndex until end scroll when jumping
            currentIndex = toIndex
//        }
//
//        if !isJumping && !isLayoutingSubviews {
            delegate?.swipeMenuView(self, didChangeIndexFrom: fromIndex, to: toIndex)
//        }
    }
}

extension SwipeMenuView: ContentScrollViewDataSource {
    
    func numberOfPages(in contentScrollView: ContentScrollView) -> Int {
        return self.dataSource?.numberOfPages(in: self) ?? 0
    }
    
    func contentScrollView(_ contentScrollView: ContentScrollView, viewForPageAt index: Int) -> UIView? {
        return self.dataSource?.swipeMenuView(self, viewControllerForPageAt: index).view
    }
    
}

