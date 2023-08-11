//
//  Model.swift
//  ToDoList
//
//  Created by Hyunwoo Lee on 2023/08/04.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
       insertDate = Date()
    }
    
    static var dummyMemoList = [
    Memo(content: "메모1"),
    Memo(content: "메모2")
    ]
}
