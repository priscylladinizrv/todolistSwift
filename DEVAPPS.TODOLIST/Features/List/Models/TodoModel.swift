//
//  ListTableViewCellModel.swift
//  DEVAPPS.TODOLIST
//
//  Created by priscylla.d.valenca on 11/08/20.
//  Copyright © 2020 Priscylla Diniz. All rights reserved.
//

import UIKit

struct TodoModel {
    
    let type: ModelType
    let todoDescription: String
    let date: Date
    
    enum ModelType{
        case onPriority, daily, home
        
        var typeDescription: String {
            switch self {
            case .onPriority:
                return "ON PRIORITY"
            case .daily:
                return "DAILY"
            case .home:
                return "HOME"
            }
        }
        
        var typeColor:  UIColor{
            switch self {
            case .onPriority:
                return UIColor(named: "on_priority_color")!
            case .daily:
                return UIColor(named: "daily_color")!
            case .home:
                return UIColor(named: "home_color")!
            
            }
        }
       static var allTypes: [ModelType]{
            [.onPriority, .daily, .home]
        }
        
    }
}
