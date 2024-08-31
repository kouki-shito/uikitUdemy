//
//  ViewController.swift
//  uikitUdemy
//
//  Created by 市東 on 2024/08/30.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension ViewController {
    private func style() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout(){
        view.backgroundColor = .white
        view.addSubview(mainView)

        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainView.trailingAnchor, multiplier: 1)

        ])
    }
}

