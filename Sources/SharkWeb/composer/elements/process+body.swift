//
//  process+body.swift
//  SharkWebDev
//
//  Created by Adrian Herridge on 29/08/2021.
//

import Foundation

public extension WebProcess {
    func body(_ closure: WebComposerClosure) {
        self.block("body") {
            closure()
        }
    }
}
