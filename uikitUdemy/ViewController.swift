//
//  ViewController.swift
//  uikitUdemy
//
//  Created by 市東 on 2024/08/30.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MainView()
    let signButton = UIButton(type: .system)
    let errorMsglabel = UILabel()

    var username : String? {
        return mainView.textFields.text
    }

    var password : String? {
        return mainView.passwordFields.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension ViewController {
    private func style() {
        mainView.translatesAutoresizingMaskIntoConstraints = false

        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.configuration = .filled()
        signButton.configuration?.imagePadding = 8
        signButton.setTitle("Sign In", for: [])
        signButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)

        errorMsglabel.translatesAutoresizingMaskIntoConstraints = false
        errorMsglabel.textAlignment = .center
        errorMsglabel.textColor = .systemRed
        errorMsglabel.numberOfLines = 0
        errorMsglabel.isHidden = false
    }

    private func layout(){

        view.backgroundColor = .white
        view.addSubview(mainView)
        view.addSubview(signButton)
        view.addSubview(errorMsglabel)

        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainView.trailingAnchor, multiplier: 2)
        ])

        NSLayoutConstraint.activate([
            signButton.topAnchor.constraint(equalToSystemSpacingBelow: mainView.bottomAnchor, multiplier: 2),
            signButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            signButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorMsglabel.topAnchor.constraint(equalToSystemSpacingBelow: signButton.bottomAnchor, multiplier: 2),
            errorMsglabel.leadingAnchor.constraint(equalTo: signButton.leadingAnchor),
            errorMsglabel.trailingAnchor.constraint(equalTo: signButton.trailingAnchor)
        ])


    }
}

extension ViewController {

    @objc func signInTapped(sender : UIButton) {
        errorMsglabel.isHidden = true
        login()
    }

    private func login(){
        guard let username = username,let password = password else {
            assertionFailure("Username / password should never be nil")
            return // nil error (normal "" is not nil)
        }
        if username.isEmpty || password.isEmpty {
            configurationView(withMessage: "Username / Password cannot be blank")
            return
        }

        if username == "Kevin" && password == "welcome" {

            signButton.configuration?.showsActivityIndicator = true
            mainView.textFields.isEnabled = false
            mainView.passwordFields.isEnabled = false

        }else {
            configurationView(withMessage: "Username or Password is incorrect.")
            return
        }
    }

    private func configurationView(withMessage message : String){

        errorMsglabel.text = message
        errorMsglabel.isHidden = false

    }
}
