//
//  File.swift
//  
//
//  Created by Adrian Herridge on 03/05/2020.
//

import Foundation

extension HttpRequest {
    var cookie: SWCookie {
        var cookie = SWCookie()
        if let auth = self.cookieData()["AuthToken"] {
            cookie.authToken = auth
        }
        return cookie
    }
}
