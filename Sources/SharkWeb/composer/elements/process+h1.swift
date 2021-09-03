//
//  process+h1.swift
//  SharkWebDev
//
//  Created by Adrian Herridge on 29/08/2021.
//

import Foundation

public extension WebProcess {
    func h1(_ value: String, _ closure: WebComposerClosure? = nil) {
        self.block("h1") {
            closure?()
            self.output(value)
        }
    }
    func h2(_ value: String, _ closure: WebComposerClosure? = nil) {
        self.block("h2") {
            closure?()
            self.output(value)
        }
    }
    func h3(_ value: String, _ closure: WebComposerClosure? = nil) {
        self.block("h3") {
            closure?()
            self.output(value)
        }
    }
    func h4(_ value: String, _ closure: WebComposerClosure? = nil) {
        self.block("h4") {
            closure?()
            self.output(value)
        }
    }
}
