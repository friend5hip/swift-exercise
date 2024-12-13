//
//  Zoo.swift
//  Zoo
//
//  Created by 전우정 on 12/12/24.
//

class Zoo {
    static let shared = Zoo() // 싱글폰 패턴
    private init () {}
    
    private var animals: [Animal] = [
        Mammal(name: "토끼", diet: "초식", photo: "rabbit", shortFur: true),
        Mammal(name: "호랑이", diet: "육식", photo: "tiger", shortFur: true)
    ]
    
    func allAnimals() -> [Animal] {
        return animals
    }
}
