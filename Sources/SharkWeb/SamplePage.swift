//
//  SamplePage.swift
//  SharkWebDev
//
//  Created by Adrian Herridge on 29/08/2021.
//

import Foundation

class SamplePage: SRKWebHtmlEndpoint {

    var initialEndpoint: Bool = true
    
    var menuEntry: (primary: String, secondary: String?)? = ("Home",nil)
    
    func content(_ p: WebProcess) {
        p.html {
            p.class("testClass")
            p.id(UUID().uuidString.lowercased())
            p.body {
                p.h1("Sample Page \(Int.random(in: 0...1000000)) \(Date())") {
                    p.id(UUID().uuidString.lowercased())
                }
                p.h2("Sample Page \(Int.random(in: 0...1000000)) \(Date())") {
                    p.id(UUID().uuidString.lowercased())
                }
                p.h3("Sample Page \(Int.random(in: 0...1000000)) \(Date())") {
                    p.id(UUID().uuidString.lowercased())
                }
                p.h4("Sample Page \(Int.random(in: 0...1000000)) \(Date())") {
                    p.id(UUID().uuidString.lowercased())
                }
                p.h4("non-closure example")
                p.h1("Styled out") {
                    p.style([.height(value: 200),.width(value: 500)])
                }
            }
        }
    }
    
    func view(_ p: WebProcess) {
        
    }
    
    func modify(_ p: WebProcess) {
        
    }
    
    func new(_ p: WebProcess) {
        
    }
    
    func save(_ p: WebProcess) {
        
    }
    
    func delete(_ p: WebProcess) {
        
    }
    
    func raw(_ p: WebProcess) {
        
    }
    
    var title: String = "Sample Page"
    var module: String?
    var controller: String?
    var requiresAuth: Bool = false
    
}
