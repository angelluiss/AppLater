//
//  consta .swift
//  ceibaApp (iOS)
//
//  Created by AR on 22/4/22.
//

import Foundation
import SwiftUI

struct ConstansUtils{
    var dispositivo = UIDevice.current.model
    /*if(dispositivo == "Ipad"){
        var sizeD = 28
        var sizeC = 28
        var sizeB = 28
        var sizeA = 28
    }*/
    static let fontConstant: String = "arial"
    static let fontSizeD: Double = 24
    static let fontSizeC: Double = 20
    static let fontSizeB: Double = 18
    static let fontSizeA: Double = 16
    
    // MARK: - URL
    static let URLusers: String = "https://jsonplaceholder.typicode.com/users"
}
