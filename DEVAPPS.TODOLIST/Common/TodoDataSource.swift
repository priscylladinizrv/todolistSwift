//
//  TodoDataSource.swift
//  DEVAPPS.TODOLIST
//
//  Created by priscylla.d.valenca on 11/08/20.
//  Copyright © 2020 Priscylla Diniz. All rights reserved.
//

import Foundation

final class TodoDataSource {
    
    static let shared = TodoDataSource()
    
    private init() {}
    
    var todos: [TodoModel] = [
        
    ]
    
    
}
