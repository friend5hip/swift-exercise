//
//  ViewController.swift
//  TableView
//
//  Created by 전우정 on 12/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // 메모 저장 배열
    var memoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addMemo(_ sender: UIButton) {
        if textField.text! != "" {
            memoList.append(textField.text!)
        }
        tableView.reloadData()
        textField.text! = ""
        
        // 자동으로 스크롤 이동
        let lastIndex = IndexPath(row: memoList.count - 1, section: 0)
        tableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)
    }
    
    // MARK: -UITableViewDataSource 메서드
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }
    
}
