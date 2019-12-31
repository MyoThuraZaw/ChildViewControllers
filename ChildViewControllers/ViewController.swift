//
//  ViewController.swift
//  ChildViewControllers
//
//  Created by Myo Thura Zaw on 1/1/20.
//  Copyright © 2020 Myo Thura Zaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let secondChildVC = SecondChildVC()

    enum Segues {
        static let toFirstChild = "ToFirstChild"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSecondChildVC()
    }
    
    func addSecondChildVC() {
        addChild(secondChildVC)
        view.addSubview(secondChildVC.view)
        secondChildVC.view.backgroundColor = .yellow
        secondChildVC.didMove(toParent: self)
        setSecondChildVCConstraints()
    }

    func setSecondChildVCConstraints() {
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        secondChildVC.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toFirstChild {
            let destVC = segue.destination as! FirstChildVC
            destVC.view.backgroundColor = .blue
        }
    }
}

