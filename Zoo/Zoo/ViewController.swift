//
//  ViewController.swift
//  Zoo
//
//  Created by User on 12/12/24.
//

/*
 설계 개요
 Animal 클래스 (부모 클래스)

 공통 속성: 이름, 식성, 사진
 공통 메서드: makeSound()
 상속된 동물 클래스

 Mammal (포유류): 추가 속성으로 털 종류, 젖을 먹이는 특성.
 Bird (조류): 추가 속성으로 날개 길이, 날 수 있는지 여부.
 Reptile (파충류): 추가 속성으로 체온 조절 방식.
 Zoo 클래스

 동물들을 저장하고 관리하는 역할.
 동물 추가, 제거, 필터링 메서드 제공.
 프로토콜

 SoundMaking: 동물이 반드시 makeSound() 메서드를 구현하도록 강제.
 Eatable: 동물이 반드시 eat() 메서드를 구현하도록 강제.
 UI 구성

 동물 리스트 화면: 동물 정보를 리스트뷰로 보여줌.
 동물 추가 화면: 새로운 동물을 추가 가능.
 */

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewSpacing = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // CollectionView item 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Zoo.shared.allAnimals().count
    }
    
    // CollectionView Cell의 Object
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as! AnimalCell
        let animal = Zoo.shared.allAnimals()[indexPath.row]
        cell.imageViewPhoto.image = UIImage(named: animal.photo)
        return cell
    }
    
    // 컬렉션뷰 셀의 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - collectionViewSpacing) / 2
        return CGSize(width: width, height: width * 1.2)
    }
    
    // CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewSpacing
    }
    
    // CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewSpacing
    }
}
