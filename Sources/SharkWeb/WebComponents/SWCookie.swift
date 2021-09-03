//
//  SWCookie.swift
//  Created by Adrian Herridge on 31/07/2021.
//

import Foundation

public class SWCookie {
    public var authToken: String?
    public func compiled() -> String {
        return "AuthToken=\(authToken ?? ""); "
    }
}
