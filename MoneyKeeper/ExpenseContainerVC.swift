//
//  ExpenseContainerVC.swift
//  MoneyKeeper
//
//  Created by Dung on 7/10/17.
//  Copyright © 2017 Dung. All rights reserved.
//

import UIKit
struct SegueIdentifier {
    static let embedMenu = "embedMenu"
}
enum SelectedCellType: Int {
    case expense
    case income
    case transaction
    case remain
}
class ExpenseContainerVC: UIViewController {
    
    //MARK: Config menu
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    var menuVC : MenuTableViewController?
    var isMenuOpen: Bool = true {
        didSet {
            if isMenuOpen {
                self.menuTopConstraint.constant = 0
            } else {
                self.menuTopConstraint.constant = -self.menuContainerView.bounds.height
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    //MARK: container VC
    
    @IBOutlet weak var expenseVC: UIView!
    @IBOutlet weak var incomeVC: UIView!
    @IBOutlet weak var transactionVC: UIView!
    @IBOutlet weak var remainVC: UIView!
    //MARK: Keyboard
    @IBOutlet weak var keyboardVC: UIView!
    @IBOutlet weak var keyboardBottomConstraint: NSLayoutConstraint!
    var isKeybroadOpen: Bool = true {
        didSet {
            if isKeybroadOpen {
                self.keyboardBottomConstraint.constant = 0
                
            } else {
                self.keyboardBottomConstraint.constant = -self.keyboardVC.bounds.height
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        isMenuOpen = false
        isKeybroadOpen = false
        registerNotification()
        
    }
    //MARK: Notification
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(displayKeybroad), name: NotificationKey.displayKeybroad, object: nil)
    }
    func displayKeybroad() {
        isKeybroadOpen = !isKeybroadOpen
    }
    //MARK: Function
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.embedMenu:
            menuVC = segue.destination as? MenuTableViewController
            menuVC?.delegate = self
        default:
            return
        }
    }
    
    
    
    // MARK: Action
    
    @IBAction func showMenu(_ sender: Any) {
        isMenuOpen = !isMenuOpen
        
    }
    
}
extension ExpenseContainerVC: MenuTableViewControllerDelegate {
    func passTitleName(text: String) {
        menuButton.setTitle(text, for: UIControlState.normal)
    }
    func didSelectCell(at indexPath: IndexPath) {
        hidenAllContainer()
        switch indexPath.row {
        case SelectedCellType.expense.rawValue:
            self.expenseVC.isHidden = false
        case SelectedCellType.income.rawValue:
            self.incomeVC.isHidden = false
        case SelectedCellType.transaction.rawValue:
            self.transactionVC.isHidden = false
        case SelectedCellType.remain.rawValue:
            self.remainVC.isHidden = false
        default:
            return
        }
        isMenuOpen = false
    }
    func hidenAllContainer() {
        self.expenseVC.isHidden = true
        self.incomeVC.isHidden = true
        self.transactionVC.isHidden = true
        self.remainVC.isHidden = true
    }
}

