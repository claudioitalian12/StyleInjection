//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 29/05/22.
//

import Foundation
import UIKit

// MARK: - StyleInjectionGroup.
public protocol StyleInjectionGroup {
    func getStylizable(key: StyleInjectionKey) -> StyleInjection?
    func applyStyle<View: UIView>(key: StyleInjectionKey, view: View)
}
