//
//  ViewController.swift
//  TableViewReuse
//
//  Created by cba023 on 05/31/2021.
//  Copyright (c) 2021 cba023. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = ListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

