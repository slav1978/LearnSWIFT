import Foundation
import Apis
import SwiftUI

enum test {
    case name
    case email
    case username
    case pictureLarge
    case pictureMedium
    case pictureThumbnail
}

func getValue (_ type: test) -> String {
    switch type {
    case .name:
        return "name1"
    case .email:
        return "email1"
    case .username:
        return "username1"
    case .pictureLarge:
        return "pictureLarge1"
    case .pictureMedium:
        return "pictureMedium1"
    case .pictureThumbnail:
        return "pictureThumbnail1"
    }
}

print(getValue(.email))









