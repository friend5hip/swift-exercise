//
//  ViewController.swift
//  BMIRecoder
//
//  Created by 전우정 on 12/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, AddViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // (String, String, String, String, String) 튜플의 배열
    var tableViewData: [(String, String, String, String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! TableViewCell
        cell.labelDate.text = tableViewData[indexPath.row].0
        cell.labelHeight.text = tableViewData[indexPath.row].1
        cell.labelWeight.text = tableViewData[indexPath.row].2
        cell.labelBMI.text = tableViewData[indexPath.row].3
        cell.labelStatus.text = tableViewData[indexPath.row].4
        return cell
    }
    
    func didUpdateBMI(receivedData: (String, String, String, String, String)) {
        tableViewData.append(receivedData)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // nil이 아닐 경우
        if let addVC = segue.destination as? AddViewController {
            addVC.delegate = self // 델리게이트 설정
        }
    }
    
}

