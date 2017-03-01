//
//  RedCell.swift
//  CollView
//
//  Created by Terje Lønøy on 28/02/2017.
//  Copyright © 2017 Terje Lønøy. All rights reserved.
//

import Foundation
import UIKit

class RedCell : UICollectionViewCell {
    let textView = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let background = UIView()
        background.backgroundColor = UIColor.red
        
        addSubview(background)
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(textView)
        textView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func setLabelText (string: String) {
        textView.text = string
    }
}
