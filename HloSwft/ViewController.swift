//
//  ViewController.swift
//  HloSwft
//
//  Created by Boss on 02.04.16.
//  Copyright © 2016 PetroKov_LSR_P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
  
    @IBOutlet weak var inputField: UITextField!

    @IBAction func buttonPressed(sender: AnyObject) {
        
        let userName = inputField.text ?? "" //тернарный оператор
        let greeting = "Бобра тебе, " + userName
        
        greetingLabel.text = greeting
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputField.delegate = self //ViewController теперь является делегатом для поля ввода. Это как бы подписка на события
    }

}

//тот, кто является делегатом для ViewController, должен поддерживать этот протокол (интефейс)
extension ViewController:UITextFieldDelegate {
    //когда юзер нажимает ввод, вызывается этот метод
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //отменчеят отвественность за это событие (пропадает клавиатура в данном случае)
        textField.resignFirstResponder()
        return true
    }

    //будем заменять цифры на слова
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                        replacementString string: String) -> Bool {
        
        //Далее пробуем прочитать textFiels.text как NSString, и если это успешно, вызвать метод замены строк
        var applyString = (textField.text as? NSString)?.stringByReplacingCharactersInRange(range, withString: string)
        
        //Это словарь
        let elemtnsToConvert = ["1":"Один",
                                "2":"Два",
                                "3":"Три",
                                "4":"Четыре",
                                "5":"Пять",
                                "6":"Шесть",
                                "7":"Семь"]
        
        for (digit, letters) in elemtnsToConvert{
            //? означает проверку, что applyString не nil, иначе метод выполняться не станет (опциональная цепочка)
            applyString = applyString?.stringByReplacingOccurrencesOfString(digit, withString: letters)
        }
        
        textField.text = applyString
        
        return false
    }
}
