//
//  MainView.swift
//  uikitUdemy
//
//  Created by 市東 on 2024/08/30.
//

import Foundation
import UIKit

class MainView : UIView{

    let stackView = UIStackView()
    let textFields = UITextField()
    let passwordFields = UITextField()
    let dividerView = UIView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override var intrinsicContentSize: CGSize{
//        return CGSize(width: 200, height: 200)
//    }

}

extension MainView {

    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        textFields.translatesAutoresizingMaskIntoConstraints = false
        textFields.placeholder = "username"
        textFields.delegate = self

        passwordFields.translatesAutoresizingMaskIntoConstraints = false
        passwordFields.placeholder = "password"
        passwordFields.isSecureTextEntry = true
        passwordFields.delegate = self

        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill

    }

    func layout(){
        
        stackView.addArrangedSubview(textFields)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordFields)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension MainView : UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFields.endEditing(true)
        passwordFields.endEditing(true)
        return true
    }

//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != "" {
//            return true
//        }else{
//            return false
//        }
//    }

    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
