//
//  TransactionTableViewController.swift
//  MoneyKeeper
//
//  Created by Dung on 7/10/17.
//  Copyright © 2017 Dung. All rights reserved.
//

import UIKit

class TransactionTableViewController: UITableViewController {

    @IBOutlet weak var amountTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTF.delegate = self
        registerNotification()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handeGetResultCaculator(_:)), name: NotificationKey.resultCaculator, object: nil)
    }
    
    func handeGetResultCaculator(_ notification: Notification) {
        let text = notification.object as! String
        amountTF.text = text
    }
    
    
}
extension TransactionTableViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NotificationKey.displayKeybroad, object: nil)
        return false
    }
}
