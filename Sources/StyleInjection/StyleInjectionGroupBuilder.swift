//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 29/05/22.
//

import Foundation
import UIKit

// MARK: - Array StyleInjectionGroup.
extension Array: StyleInjectionGroup where Element == StylizableGroup {
    public func getStylizable(key: StyleInjectionKey) -> StyleInjection? {
        self.first {
            $0.getStylizable(key: key) != nil
        }?.stylizable?.1
    }
    
    public func applyStyle<View: UIView>(key: StyleInjectionKey, view: View) {
        guard let stylizable = getStylizable(key: key) else { return }
        
        stylizable.applyStyle(to: view)
    }
    
    public var stylizable: [StylizableGroup] { self }
}

extension Array where Element == StyleInjectionGroup {
    public func getStylizable(key: StyleInjectionKey) -> StyleInjection? {
        (self.first {
            $0.getStylizable(key: key) != nil
        } as? StylizableGroup)?.stylizable?.1
    }
    
    public func applyStyle<View: UIView>(key: StyleInjectionKey, view: View) {
        guard let stylizable = getStylizable(key: key) else { return }
        
        stylizable.applyStyle(to: view)
    }
}

// MARK: - StyleInjectionGroupBuilder.
@resultBuilder
public struct StyleInjectionGroupBuilder {
    public static func buildBlock(_ group: StylizableGroup...) -> [StyleInjectionGroup] {
        group.compactMap { $0 }
    }
    
    public static func buildOptional(_ group: [StylizableGroup]?) -> [StyleInjectionGroup] {
        group?.compactMap { $0 } ?? []
    }
    
    public static func buildEither(first group: [StylizableGroup]) -> [StyleInjectionGroup] {
        group.compactMap { $0 }
    }
    
    public static func buildEither(second group: [StylizableGroup]) -> [StyleInjectionGroup] {
        group.compactMap { $0 }
    }
}
