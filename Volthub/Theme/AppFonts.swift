//
//  AppFonts.swift
//  Volthub
//
//  Created by Tanvir Alam on 28/2/24.
//

import SwiftUI

class AppFonts {
    enum TextStyle {
        case title
        case title2
        case body
        case body2
        case small
    }
    
    static func font(for style: TextStyle) -> Font {
        let screenWidth = UIScreen.main.bounds.width
        
        switch style {
        case .title:
            switch screenWidth {
            case 0..<375: // iPhone SE, iPhone 8, iPhone 7, iPhone 6s, iPhone 6
                return Font.custom("SpaceGrotesk-Bold", size: 28)
            case 375..<414: // iPhone 11, iPhone XR, iPhone X, iPhone XS
                return Font.custom("SpaceGrotesk-Bold", size: 32)
            case 414..<500: // iPhone 11 Pro Max, iPhone XS Max
                return Font.custom("SpaceGrotesk-Bold", size: 36)
            default: // Default case, adjust as needed
                return Font.custom("SpaceGrotesk-Bold", size: 32)
            }
        case .title2:
            switch screenWidth {
            case 0..<375:
                return Font.custom("SpaceGrotesk-Bold", size: 24)
            case 375..<414:
                return Font.custom("SpaceGrotesk-Bold", size: 28)
            case 414..<500:
                return Font.custom("SpaceGrotesk-Bold", size: 32)
            default:
                return Font.custom("SpaceGrotesk-Bold", size: 28)
            }
        case .body:
            switch screenWidth {
            case 0..<375:
                return Font.custom("SpaceGrotesk-Regular", size: 18)
            case 375..<414:
                return Font.custom("SpaceGrotesk-Regular", size: 20)
            case 414..<500:
                return Font.custom("SpaceGrotesk-Regular", size: 24)
            default:
                return Font.custom("SpaceGrotesk-Regular", size: 20)
            }
        case .body2:
            switch screenWidth {
            case 0..<375:
                return Font.custom("SpaceGrotesk-Regular", size: 13)
            case 375..<414:
                return Font.custom("SpaceGrotesk-Regular", size: 13)
            case 414..<500:
                return Font.custom("SpaceGrotesk-Regular", size: 13)
            default:
                return Font.custom("SpaceGrotesk-Regular", size: 14)
            }
        case .small:
            switch screenWidth {
            case 0..<375:
                return Font.custom("SpaceGrotesk-Regular", size: 11)
            case 375..<414:
                return Font.custom("SpaceGrotesk-Regular", size: 12)
            case 414..<500:
                return Font.custom("SpaceGrotesk-Regular", size: 13)
            default:
                return Font.custom("SpaceGrotesk-Regular", size: 14)
            }
        }
    }
}

