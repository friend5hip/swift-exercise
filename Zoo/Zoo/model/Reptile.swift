//
//  Reptile.swift
//  Zoo
//
//  Created by 전우정 on 12/12/24.
//

import Foundation

// 양서류 클래스
class Reptile: Animal {
    var temperatureControl: Bool
    
    init(name: String, diet: String, photo: String, temperatrueControl: Bool) {
        self.temperatureControl = temperatrueControl
        super.init(name: name, diet: diet, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은 양서류이므로 울음소리를 내지 않아요."
    }
}
