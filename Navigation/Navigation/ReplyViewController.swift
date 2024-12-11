//
//  ReplyViewController.swift
//  Navigation
//
//  Created by 전우정 on 12/10/24.
//

import UIKit

//protocol ReplyDelgate {
//    func reply(_controller: ReplyViewController, message: String)
//}

class ReplyViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
//    var delegate: ReplyDelgate?
    
    var message = ""
    
    var onReply: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = message
        // Do any additional setup after loading the view.
    }
    
    @IBAction func barBuuttonOk(_ sender: UIBarButtonItem) {
//        if delegate != nil {
//            delegate?.reply(_controller: self, message: textField.text!)
//        }
        onReply?(textField.text!)
        
        // 메인 화면으로
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
