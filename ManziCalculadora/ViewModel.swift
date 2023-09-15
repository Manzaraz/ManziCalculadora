//
//  ViewModel.swift
//  ManziCalculadora
//
//  Created by Christian Manzaraz on 14/09/2023.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var textFieldValue: String = "0"
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shouldRunOperation: Bool = false
    
    func logic(key: KeyboardButton) {
        switch key.type {
        case .number(let value):
            if shouldRunOperation {
                textFieldValue = "0"
            }
            textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
        case .reset:
            textFieldValue = "0"
            textFieldSavedValue = "0"
            currentOperationToExecute = nil
            shouldRunOperation = false
        case .result:
            guard let operation = currentOperationToExecute else { return  }
            
            switch operation {
            case .multiplication:
                textFieldValue = "\(Int(textFieldSavedValue)! * Int(textFieldValue)!)"
            case .sum:
                textFieldValue = "\(Int(textFieldSavedValue)! + Int(textFieldValue)!)"
            case .division:
                textFieldValue = "\(Int(textFieldSavedValue)! / Int(textFieldValue)!)"
            case .subtraction:
                textFieldValue = "\(Int(textFieldSavedValue)! - Int(textFieldValue)!)"
            }
        case .operation(let type):
            textFieldSavedValue = textFieldValue
            currentOperationToExecute = type
            shouldRunOperation = true 
        }
    }
    
}
