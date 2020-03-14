//
//  ViewController.swift
//  BMOApp
//
//  Created by rau4o on 3/13/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import BmoViewPager

class ViewController: UIViewController {
    
    lazy var viewPager: BmoViewPager = {
        let bmo = BmoViewPager()
        bmo.dataSource = self as BmoViewPagerDataSource
        bmo.scrollable = true
        return bmo
    }()
    
    lazy var navigationBMOBar: BmoViewPagerNavigationBar = {
        let bmo = BmoViewPagerNavigationBar()
        return bmo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureUI()
        navigationBMOBar.autoFocus = false
        navigationBMOBar.viewPager = viewPager
        
        navigationBMOBar.backgroundColor = .white
//        self.navigationItem.titleView = navigationBar
//        navigationBar.viewPager = viewPager
    }
    
    private func configureUI() {
        view.addSubview(viewPager)
        view.addSubview(navigationBMOBar)
        
        viewPager.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        navigationBMOBar.centerX(inView: view)
        navigationBMOBar.centerY(inView: view)
        navigationBMOBar.setDimension(height: 100, width: 200)
    }
}

extension ViewController: BmoViewPagerDataSource {
    
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.strokeWidth     : 1.0,
            NSAttributedString.Key.strokeColor     : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.groupTableViewBackground
        ]
    }
    
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 2
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemTitle(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> String? {
        return page == 0 ? "First" : "Second"
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0:
            let vc = FirstVC()
            return vc
        case 1:
            let vc2 = SecondVC()
            return vc2
        default:
            break
        }
        return UIViewController()
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemSize(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> CGSize {
        return CGSize(width: navigationBar.bounds.width / 2, height: navigationBar.bounds.height)
    }
    
}


extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimension(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
}



