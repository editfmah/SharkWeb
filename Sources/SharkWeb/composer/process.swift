//
//  File.swift
//  
//
//  Created by Adrian Herridge on 29/08/2021.
//

import Foundation

let elementDecorators = ["id","class","style"]

public class WebProcess {
    
    // navigation/action properties
    var navigation: WebNavigationPosition
    var user: WebUser?
    var ephemiralData: [String:String] = [:]
    var redirect: String?
    
    internal var blocks: [String] = []
    internal var body: String = ""
    internal var elementProperties: [String:[String:Any?]] = [:]
    
    public init(navigation: WebNavigationPosition) {
        self.navigation = navigation
    }
    
    public func block(_ element: String, _ closure: WebComposerClosure) {
        blocks.append(UUID().uuidString.lowercased().replacingOccurrences(of: "-", with: ""))
        output("<\(element)$elementProperties\(blocks.last!)>")
        elementProperties[blocks.last!] = [:]
        closure()
        var compiled = ""
        if elementProperties[blocks.last!]!.values.filter({ $0 != nil }).count > 0 {
            compiled = " "
            for kvp in elementProperties[blocks.last!]! {
                compiled += kvp.key
                compiled += "="
                if let value = kvp.value as? String {
                    compiled += "\"\(value)\" "
                } else if let value = kvp.value as? Int {
                    compiled += "\(value) "
                }
            }
        }
        elementProperties.removeValue(forKey: blocks.last!)
        body = body.replacingOccurrences(of: "$elementProperties\(blocks.last!)", with: compiled)
        output("</\(element)>")
        blocks.removeLast()
    }
    
    public func output(_ data: String) {
        for _ in 0..<blocks.count {
            body += "   "
        }
        body += data
        body += "\n"
    }
    
    public func width(_ w: Int) {
        elementProperties[blocks.last!]!["width"] = w
    }
    
    public func `class`(_ cls: String) {
        elementProperties[blocks.last!]!["class"] = cls
    }
    
    public func id(_ id: String) {
        elementProperties[blocks.last!]!["id"] = id
    }
    
    public func style(_ style: StyleProperty) {
        elementProperties[blocks.last!]!["style"] = style.compiled
    }
    
    public func style(_ styles: [StyleProperty]) {
        var compiled = ""
        for s in styles {
            compiled += s.compiled
        }
        elementProperties[blocks.last!]!["style"] = compiled
    }
    
    public func redirect(target: String) {
        self.redirect = target
    }
    
    public func redirect(navigation: WebNavigationPosition) {
        self.redirect = navigation.url
    }
    
}
