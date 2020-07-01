//
//  themeSource.swift
//  iOS-cw5-p2(XO)
//
//  Created by laila al mutawa on 6/30/20.
//  Copyright © 2020 ljmutawa. All rights reserved.
//

import Foundation
import UIKit
import GameKit

struct Theme {
    var backgroundColor    : UIColor
    var xButtonColor       : UIColor
    var oButtonColor       : UIColor
    var nextRoundColor     : UIColor
    var nextRoundTextColor : UIColor
    var textColor          : UIColor
    
    static let theme1 = Theme(backgroundColor: #colorLiteral(red: 0.9984241128, green: 0.5352126956, blue: 0.4186493158, alpha: 1), xButtonColor: #colorLiteral(red: 0.9096292853, green: 0.8307132721, blue: 0.7075961232, alpha: 1), oButtonColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), nextRoundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), nextRoundTextColor: #colorLiteral(red: 0.9049564004, green: 0.8308910131, blue: 0.7077001929, alpha: 1), textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let theme2 = Theme(backgroundColor: #colorLiteral(red: 0.9278505445, green: 0.7994333506, blue: 0.5154756904, alpha: 1), xButtonColor: #colorLiteral(red: 0.644271493, green: 0.8312013745, blue: 0.6824532151, alpha: 1), oButtonColor: #colorLiteral(red: 0.2008249164, green: 0.6842458844, blue: 0.6617709994, alpha: 1), nextRoundColor: #colorLiteral(red: 0.9059190154, green: 0.9412721992, blue: 0.7628511786, alpha: 1), nextRoundTextColor: #colorLiteral(red: 0.9278147817, green: 0.799485743, blue: 0.5107561946, alpha: 1), textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    static let theme3 = Theme(backgroundColor: #colorLiteral(red: 0.9381145835, green: 0.9509227872, blue: 0.8666700125, alpha: 1), xButtonColor: #colorLiteral(red: 0.4998130202, green: 0.6150642037, blue: 0.6175774932, alpha: 1), oButtonColor: #colorLiteral(red: 0.3153876066, green: 0.3902765512, blue: 0.3978122473, alpha: 1), nextRoundColor: #colorLiteral(red: 0.8508212566, green: 0.3814789057, blue: 0.345125556, alpha: 1), nextRoundTextColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textColor: #colorLiteral(red: 0.780164063, green: 0.3437562585, blue: 0.3204297721, alpha: 1))
    static let theme4 = Theme(backgroundColor: #colorLiteral(red: 0.1083880886, green: 0.2730190456, blue: 0.3317446709, alpha: 1), xButtonColor: #colorLiteral(red: 0.902330637, green: 0.43937549, blue: 0.3217788339, alpha: 1), oButtonColor: #colorLiteral(red: 0.8717752099, green: 0.7208406329, blue: 0.3230470717, alpha: 1), nextRoundColor: #colorLiteral(red: 0, green: 0.6314786077, blue: 0.5602647066, alpha: 1), nextRoundTextColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    //    func randomTheme() -> Theme {
    //        let themeIndex = GKRandomSource.sharedRandom().nextInt(upperBound: themes.count)
    //        return themes[themeIndex]
    //    }
}
