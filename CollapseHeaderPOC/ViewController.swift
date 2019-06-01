//
//  ViewController.swift
//  CollapseHeaderPOC
//
//  Created by Ashwani on 01/06/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet weak var headerviewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    let headerViewMaxHeight :CGFloat = 250
    let headerViewMinHeight: CGFloat = 44 + UIApplication.shared.statusBarFrame.height
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y: CGFloat = scrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = headerviewHeightConstraint.constant - y
        
        if newHeaderViewHeight > headerViewMaxHeight {
            headerviewHeightConstraint.constant = headerViewMaxHeight
        } else if newHeaderViewHeight < headerViewMinHeight {
            headerviewHeightConstraint.constant = headerViewMinHeight
        } else {
            headerviewHeightConstraint.constant = newHeaderViewHeight
            scrollView.contentOffset.y = 0 // block scroll view
        }
    }
    
}
