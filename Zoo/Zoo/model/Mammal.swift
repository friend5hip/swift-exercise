//
//  Mammal.swift
//  Zoo
//
//  Created by 전우정 on 12/12/24.
//

import Foundation

// 포유류 클래스
class Mammal: Animal {
    var shortFur: Bool
    
    init(name: String, diet: String, photo: String, shortFur: Bool) {
        self.shortFur = shortFur
        super.init(name: name, diet: diet, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은 포유류 소리를 냅니다."
    }
}
