//
//  ContentScrollView.swift
//  PlaySwift
//
//  https://github.com/yysskk/SwipeMenuViewController
//

import UIKit
import Foundation

protocol ContentScrollViewDataSource {
    func numberOfPages(in contentScrollView: ContentScrollView) -> Int
    func contentScrollView(_ contentScrollView: ContentScrollView, viewForPageAt index: Int) -> UIView?
}

class ContentScrollView: UIScrollView {
    
    var dataSource: ContentScrollViewDataSource?
    
    fileprivate var pageViews: [UIView] = []
    fileprivate var currentIndex: Int = 0
    
    override func didMoveToSuperview() {
        self.setup()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.contentSize = CGSize(width: frame.width * CGFloat(pageViews.count), height: frame.height)
    }
    
    init(frame: CGRect, default index: Int) {
        super.init(frame: frame)
        self.update(index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        guard let dataSource = dataSource else { return }
        if dataSource.numberOfPages(in: self) <= 0 { return }
        setupScrollView()
        setupPages()
    }
    
    func update(_ newIndex: Int) {
        self.currentIndex = newIndex
    }
    
    func setupScrollView() {
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        isPagingEnabled = true
        isDirectionalLockEnabled = false
        alwaysBounceHorizontal = false
        scrollsToTop = false
        bounces = false
        bouncesZoom = false
        setContentOffset(.zero, animated: false)
    }
    
    func setupPages() {
        self.pageViews = []
        guard let dataSource = self.dataSource, dataSource.numberOfPages(in: self) > 0 else { return }
        self.contentSize = CGSize(width: self.frame.width * CGFloat(dataSource.numberOfPages(in: self)), height: self.frame.height)
        
        for i in 0...dataSource.numberOfPages(in: self) {
            guard let pageView = dataSource.contentScrollView(self, viewForPageAt: i) else { return }
            self.pageViews.append(pageView)
            self.addSubview(pageView)
            let leadingAnchor = i > 0 ? pageViews[i-1].trailingAnchor : self.leadingAnchor
            pageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pageView.topAnchor.constraint(equalTo: self.topAnchor),
                pageView.widthAnchor.constraint(equalTo: self.widthAnchor),
                pageView.heightAnchor.constraint(equalTo: self.heightAnchor),
                pageView.leadingAnchor.constraint(equalTo: leadingAnchor)
                ])
        }
        /*
        guard self.currentIndex < dataSource.numberOfPages(in: self) else { return }
        for k in (currentIndex + 1)..<dataSource.numberOfPages(in: self) {
            guard let pageView = dataSource.contentScrollView(self, viewForPageAt: k) else { return }
            self.pageViews.append(pageView)
            self.addSubview(pageView)
            pageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pageView.topAnchor.constraint(equalTo: self.topAnchor),
                pageView.widthAnchor.constraint(equalTo: self.widthAnchor),
                pageView.heightAnchor.constraint(equalTo: self.heightAnchor),
                pageView.leadingAnchor.constraint(equalTo: pageViews[k - 1].trailingAnchor)
                ])
        }*/
    }
    
    func jump(to index: Int, animated: Bool) {
        update(index)
        // Jumping to new index and update offset!
        self.setContentOffset(CGPoint(x: self.frame.width * CGFloat(currentIndex), y: 0), animated: animated)
    }
    
    var currentPage: UIView? {
        if currentIndex < pageViews.count && currentIndex >= 0 {
            return pageViews[currentIndex]
        }
        return nil
    }
    
    var nextPage: UIView? {
        if currentIndex < pageViews.count - 1 {
            return pageViews[currentIndex + 1]
        }
        return nil
    }
    
    var previousPage: UIView? {
        if currentIndex > 0 {
            return pageViews[currentIndex - 1]
        }
        return nil
    }

}




