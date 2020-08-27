//
//  ListCollectionViewCell.swift
//  DEVAPPS.TODOLIST
//
//  Created by priscylla.d.valenca on 27/08/20.
//  Copyright © 2020 Priscylla Diniz. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collection: UIView!
    @IBOutlet weak var labelList1: UILabel!
    @IBOutlet weak var labelList2: UILabel!
    @IBOutlet weak var labelList3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func configureCollection(with model: TodoModel) {
        collection.backgroundColor = model.type.typeColor
        labelTitle.text = model.type.typeDescription
        labelList1.text = model.todoDescription
        labelList2.text = model.todoDescription
        labelList3.text = model.todoDescription
    }
}
