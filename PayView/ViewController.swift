//
//  ViewController.swift
//  PayView
//
//  Created by mac on 2018/12/21.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let viewpay = RRPayView(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: KSCREEN_HEIGHT))
        viewpay.closure = { type in
//            self.viewModel.paytype.value = self.dataSource[type]
//            self.pay()
            print(type)
        }
        UIApplication.shared.keyWindow?.addSubview(viewpay)
    }

}

