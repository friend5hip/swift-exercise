//
//  Animal.swift
//  Zoo
//
//  Created by 전우정 on 12/12/24.
//

import Foundation

// 프로토콜 정의
protocol SoundMaking {
    func makeSound() -> String
}

class Animal {
    var name: String
    var diet: String
    var photo: String
    
    init(name: String, diet: String, photo: String) {
        self.name = name
        self.diet = diet
        self.photo = photo
    }
    
    func makeSound() -> String {
        return "동물 소리"
    }
}
