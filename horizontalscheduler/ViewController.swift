//
//  ViewController.swift
//  horizontalscheduler
//
//  Created by Michael Neas on 2/8/19.
//  Copyright © 2019 Farce Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.width = 24000
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        setupScrollView()
        
        
    }
    
    func setupScrollView() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        setupObjects()
    }
    
    func setupObjects() {
        for _ in 0..<100 {
            let rndX = Int.random(in: 0..<24000)
            let rndY = Int.random(in: 0..<Int(view.bounds.maxY))
            let rndWidth = Int.random(in: 0..<1000)
            let space = UIView(frame: CGRect(x: rndX, y: rndY, width: rndWidth, height: 100))
            space.backgroundColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
            scrollView.addSubview(space)
            
            let gesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.wasDragged(_:)))
            space.addGestureRecognizer(gesture)
        }
    }
    
    @objc func wasDragged(_ gesture: UIPanGestureRecognizer) {
        guard let gestureView =  gesture.view else { return }
        let translation = gesture.translation(in: self.view)
        gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: self.view)
    }
    
}
