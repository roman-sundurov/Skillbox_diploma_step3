//
//  ViewController.swift
//  Skillbox_diploma_step3
//
//  Created by Roman on 12.12.2021.
//

import UIKit

class VCMap: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapViewTrailingConstraint: NSLayoutConstraint!

//    @IBOutlet var mapView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor.systemGreen
        view.addSubview(statusBarView)

    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.safeAreaLayoutGuide.layoutFrame.size)
    }

    
    func updateMinZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = minScale
    }

}


extension VCMap: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.safeAreaLayoutGuide.layoutFrame.size)
    }

    func updateConstraintsForSize(_ size: CGSize) {

        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        mapViewTopConstraint.constant = yOffset
        mapViewBottomConstraint.constant = yOffset
//
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        mapViewLeadingConstraint.constant = xOffset
        mapViewTrailingConstraint.constant = xOffset
//
        print("yyy= \(yOffset), xxx= \(xOffset)")
        
        view.layoutIfNeeded()
    }

}
