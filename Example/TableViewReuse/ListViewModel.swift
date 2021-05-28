//
//  ListViewModel.swift
//  TableViewReuse_Example
//
//  Created by bo.chen on 2021/5/31.
//

import UIKit

class ListViewModel: NSObject {
    
    private var listData : [ListModel] = [] {
        didSet {
            self.bindingCallback(listData)
        }
    }
    
    var bindingCallback : (([ListModel]) -> ()) = {_ in }
    
    override init() {
        super.init()
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let path = Bundle.main.path(forResource: "List", ofType: "json")
            let data = NSData(contentsOfFile: path!)
            do {
                let list = try JSONDecoder().decode([ListModel].self, from: data! as Data)
                self.listData = list
            } catch let error {
                print(error)
            }
        }
    }
    
   
    func delete(index: Int) {
        self.listData.remove(at: index)
        
    }
    
}
