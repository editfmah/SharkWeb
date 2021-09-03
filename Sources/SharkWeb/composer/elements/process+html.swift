//
//  process+html.swift
//  SharkWebDev
//
//  Created by Adrian Herridge on 29/08/2021.
//

import Foundation

public extension WebProcess {
    func html(_ closure: WebComposerClosure) {
        self.block("html") {
            closure()
        }
    }
}
