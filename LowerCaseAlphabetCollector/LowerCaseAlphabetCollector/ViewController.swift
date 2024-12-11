//
//  ViewController.swift
//  LowerCaseAlphabetCollector
//
//  Created by 전우정 on 12/11/24.
//
// - 사용자의 입력을 받아서 소문자를 모아서 보여주는 앱
// - 테이블뷰에 리스트의 형식으로 오름차순으로 보여준다.
// - 사용하는 컬렉션: Array, Dictionary, Set

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var lowerCaseAlphabets: Set<Character> = []
    
    // Set을 정렬된 배열로 변환하는 계산 속성
    var sortedAlphabets: [Character] {
        return Array(lowerCaseAlphabets).sorted()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 데이터소스 설정
        tableView.dataSource = self
    }

    @IBAction func register(_ sender: UIButton) {
        guard let input = textField.text, !input.isEmpty else { return }
        
        if input.count == 1 {
            let char = Character(input)
            if char.isLowercase {
                lowerCaseAlphabets.insert(char)
                // 테이블뷰 새로고침
                tableView.reloadData()
                // 텍스트필드 초기화
                textField.text = ""
            } else {
                showAlert(on: self, title: "소문자가 아닙니다.")
            }
        } else {
            showAlert(on: self, title: "한 글자가 아닙니다.")
        }
    }
    
    func showAlert(on viewController: UIViewController, title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        viewController.present(alert, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lowerCaseAlphabets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // 정렬된 배열 사용
        cell.textLabel?.text = String(sortedAlphabets[indexPath.row])
        return cell
    }
}
