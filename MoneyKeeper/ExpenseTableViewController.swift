//
//  ExpenseTableViewController.swift
//  MoneyKeeper
//
//  Created by Dung on 7/10/17.
//  Copyright © 2017 Dung. All rights reserved.
//

import UIKit

class ExpenseTableViewController: UITableViewController {

    @IBOutlet weak var amountTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTF.delegate = self
        registerNotification()

        
    }
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handeGetResultCaculator(_:)), name: NotificationKey.resultCaculator, object: nil)
    }
    
    func handeGetResultCaculator(_ notification: Notification) {
        let text = notification.object as! String
        amountTF.text = text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
extension ExpenseTableViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NotificationKey.displayKeybroad, object: nil)
        return false
    }

}
