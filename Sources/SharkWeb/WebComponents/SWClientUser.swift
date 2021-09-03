//
//  File.swift
//  
//
//  Created by Adrian Herridge on 31/07/2021.
//

import Foundation

/* GRANTS: Can be anything, but also paths and activities
 *
 *  e.g. "/account/settings" && "/account/settings$modify" && "/account/settings$delete"
 */

public class WebUser : Codable {
    
    public var token: String?
    public var id: UUID?
    public var grants: [String] = []
    public var userdata: [String : String?] = [:]
    
    init(_ request: HttpRequest) {
        if let token = token {
            
        }
    }
    
    init(username: String, password: String, grants: [String]?) {
        
    }
    
    public func setGrants(grants: [String]) {
        
    }
    
    public func revalidate() {
        
    }
    
    public var authenticated: Bool {
        get {
            return true
        }
    }
    
}

public class SWAuthenticator {
    func validate(_ token: String) -> WebUser? {
        return nil
    }
}
