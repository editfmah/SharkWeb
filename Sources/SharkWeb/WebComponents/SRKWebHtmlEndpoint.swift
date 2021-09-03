//
//  SRKWebEndpoint.swift
//  SharkWebDev
//
//  Created by Adrian Herridge on 29/08/2021.
//

import Foundation

public protocol SRKWebEndpoint {
    var module: String? { get }
    var controller: String? { get }
    var requiresAuth: Bool { get }
}

public protocol SRKWebAPIEndpoint : SRKWebEndpoint {
    
}

public protocol SRKWebHtmlEndpoint : SRKWebEndpoint {
    
    var initialEndpoint: Bool { get }
    var title: String { get }
    var menuEntry: (primary: String, secondary: String?)? { get }
    
    // shows the content of a controller
    func content(_ p: WebProcess)
    
    // views a resource of a controller
    func view(_ p: WebProcess)
    
    // modifies content of a resource for this controller
    func modify(_ p: WebProcess)
    
    // creates a new resource for controller
    func new(_ p: WebProcess)
    
    // saves resource for controller, returns a http response directly for redirects etc...
    func save(_ p: WebProcess)
    
    // deletes a resource and cleans up the relationships
    func delete(_ p: WebProcess)
    
    // raw object getter
    func raw(_ p: WebProcess)
    
}
