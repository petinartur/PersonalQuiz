//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var animalChar: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
  //  var choosenAnswer: [Answer]!
    var choosenAnswer: [Answer]!
    
    var cat = 0
    var dog = 0
    var turtle = 0
    var rabbit = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        print(choosenAnswer ?? 0)
        
        for animal in choosenAnswer{
            if animal.type == .cat{
                cat += 1
            }
            if animal.type == .dog{
                dog += 1
            }
            if animal.type == .turtle{
                turtle += 1
            }
            if animal.type == .rabbit{
                rabbit += 1
            }
        }
        
        let animaals: [AnimalType: Int] =
        [
            .cat: cat,
            .dog: dog,
            .rabbit: rabbit,
            .turtle: turtle
        ]
        let sortedAnimals = animaals.sorted(by: {$0.value > $1.value} )

        let firstAnimal = sortedAnimals.first
        print(firstAnimal ?? 0)
        
        if firstAnimal?.key == AnimalType.dog{
            animalChar.text = "Вы - \(AnimalType.dog.rawValue)"
            animalDescription.text = "\(AnimalType.dog.definition)"
        }
        if firstAnimal?.key == AnimalType.cat{
            animalChar.text = "Вы - \(AnimalType.cat.rawValue)"
            animalDescription.text = "\(AnimalType.cat.definition)"
        }
        if firstAnimal?.key == AnimalType.rabbit{
            animalChar.text = "Вы - \(AnimalType.rabbit.rawValue)"
            animalDescription.text = "\(AnimalType.rabbit.definition)"
        }
        if firstAnimal?.key == AnimalType.turtle{
            animalChar.text = "Вы - \(AnimalType.turtle.rawValue)"
            animalDescription.text = "\(AnimalType.turtle.definition)"
        }
    
    }
    
}
