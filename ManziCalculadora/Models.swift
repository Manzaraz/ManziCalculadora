//
//  Models.swift
//  ManziCalculadora
//
//  Created by Christian Manzaraz on 14/09/2023.
//

import Foundation
import SwiftUI

struct KeyboardButton {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth: Bool
    let tipe: ButtonType
    
}

enum ButtonType {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType {
    case sum
    case multiplication
    case subtraction
    case division
}

