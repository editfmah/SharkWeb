//
//  File.swift
//  
//
//  Created by Adrian Herridge on 11/05/2020.
//

import Foundation

extension UUID {
    var string: String  {
        return self.uuidString.lowercased()
    }
}

public enum WebNavigationActivity : String {
    case View = "view"
    case Modify = "modify"
    case New = "new"
    case Save = "save"
    case Content = "content"
    case Delete = "delete"
    case Raw = "raw"
    static func from(string: String) -> WebNavigationActivity {
        return WebNavigationActivity.init(rawValue: string) ?? .Content
    }
}

public class WebNavigationPosition {
    
    var controller: String?
    var method: String?
    
    var action: WebNavigationActivity?
    var resource: UUID?
    var subResource: UUID?
    var version: UUID?
    var account: UUID?
    
    
    public init() {}
    
    public init(_ request: HttpRequest) {
        let path = request.path
        let components = path.components(separatedBy: "/")
        if components.count > 0 {
            controller = components[0]
        }
        if components.count > 1 {
            method = components[1]
        }
        if let action = request.params["action"] {
            self.action = WebNavigationActivity(rawValue: action)
        }
        if let resource = request.params["resource"], let uuid = UUID(uuidString: resource) {
            self.resource = uuid
        }
        if let resource = request.params["subresource"], let uuid = UUID(uuidString: resource) {
            self.subResource = uuid
        }
        if let account = request.params["account"], let uuid = UUID(uuidString: account) {
            self.account = uuid
        }
        if let version = request.params["version"], let uuid = UUID(uuidString: version) {
            self.version = uuid
        }
        if action == nil {
            switch request.method {
            case "GET":
                action = .Content
            case "POST":
                action = .New
            case "DELETE":
                action = .Delete
            case "PATCH":
                action = .Modify
            default:
                action = .Content
            }
        }
    }
    
    
    var url: String {
        get {
            var path = "/"
            if let c = controller {
                path += c
            }
            if let m = method {
                path += "/"
                path += m
            }
            path += "?"
            if let a = action {
                path += "action=\(a)&"
            }
            if let r = resource {
                path += "resource=\(r.uuidString.lowercased())&"
            }
            if let r = subResource {
                path += "subresource=\(r.uuidString.lowercased())&"
            }
            if let a = account {
                path += "account=\(a.uuidString.lowercased())&"
            }
            if let v = version {
                path += "version=\(v.uuidString.lowercased())&"
            }
            return path
        }
    }
    
    func thisBut(_ newAct: WebNavigationActivity) -> String {
        
        var path = "/"
        if let c = controller {
            path += c
        }
        if let m = method {
            path += "/"
            path += m
        }
        path += "?"
        path += "action=\(newAct.rawValue)&"
        if let r = resource {
            path += "resource=\(r.uuidString.lowercased())&"
        }
        if let r = subResource {
            path += "subresource=\(r.uuidString.lowercased())&"
        }
        if let a = account {
            path += "account=\(a.uuidString.lowercased())&"
        }
        if let v = version {
            path += "version=\(v.uuidString.lowercased())&"
        }
        return path
        
    }

}
