//
//  Bird.swift
//  Zoo
//
//  Created by 전우정 on 12/12/24.
//

import Foundation

// 조류 클래스
class Bird: Animal {
    var canFly: Bool
    
    init(name: String, diet: String, photo: String, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name, diet: diet, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은 지저귑니다."
    }
}
