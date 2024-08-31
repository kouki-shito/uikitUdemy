//
//  ButtonView.swift
//  uikitUdemy
//
//  Created by 市東 on 2024/08/30.
//

import Foundation
import UIKit

class TextView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 200)
    }

}

extension TextView {

    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
    }

    func layout(){

    }
}
