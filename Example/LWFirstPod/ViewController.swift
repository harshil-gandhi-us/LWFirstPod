//
//  ViewController.swift
//  LWFirstPod
//
//  Created by 164989979 on 02/10/2026.
//  Copyright (c) 2026 164989979. All rights reserved.
//

import UIKit
import LWFirstPod

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showDeviceInfo()
    }
    
    private func setupUI() {
        let button = UIButton(type: .system)
        button.setTitle("Show Device Info", for: .normal)
        button.addTarget(self, action: #selector(showDeviceInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showDeviceInfo() {
        LWDeviceInfo.shared.showDeviceInfoAlert(from: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

