//
//  ViewController.swift
//  Homework 3.2
//
//  Created by Stas on 23.11.2020.
//

import UIKit

class ViewController: UIViewController {

    let nlbl = UILabel()
    var counter = 0
    let vw = UIView()
    private lazy var slideToSwipe: UIPanGestureRecognizer = UIPanGestureRecognizer(
        target: self,
        action: #selector(slideToSwipeF(_:))
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        newLabel()
    }
    func newLabel(){
        nlbl.backgroundColor = .green
        nlbl.textAlignment = NSTextAlignment.center
        nlbl.text = String(counter)
        nlbl.center.x = self.view.center.x
        nlbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nlbl)
        let topConstraint1 = nlbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        let leftConstraint1 = nlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        let rightConstraint1 = nlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        let height1 = nlbl.heightAnchor.constraint(equalToConstant: 100).isActive = true
        vw.backgroundColor = .blue
        vw.center.x = self.view.center.x
        vw.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vw)
        let topConstraint2 = vw.topAnchor.constraint(equalTo: nlbl.bottomAnchor, constant: 40).isActive = true
        let leftConstraint2 = vw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        let rightConstraint2 = vw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        let height2 = vw.heightAnchor.constraint(equalToConstant: 150).isActive = true
        vw.addGestureRecognizer(slideToSwipe)
        vw.isUserInteractionEnabled = true
    }
    
    @objc func slideToSwipeF(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            if vw.frame.contains(sender.location(in: self.view)) {
                counter = counter - Int(sender.translation(in: vw).y)
                nlbl.text = String(counter)
            }
        default:
            break
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}

