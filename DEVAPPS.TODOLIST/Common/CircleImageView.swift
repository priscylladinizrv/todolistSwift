//
//  CircleImageView.swift
//  DEVAPPS.TODOLIST
//
//  Created by priscylla.d.valenca on 12/08/20.
//  Copyright © 2020 Priscylla Diniz. All rights reserved.
//

import UIKit

final class CircleImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.height / 2
    }
}
