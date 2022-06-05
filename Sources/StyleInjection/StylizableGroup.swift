//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 29/05/22.
//

import Foundation
import UIKit

// MARK: - StylizableGroup.
public struct StylizableGroup: StyleInjectionGroup {
    /// The stylizable instance with key.
    public var stylizable: (StyleInjectionKey,StyleInjection)?
    
    /// The default init.
    public init() { }
    
    /// Build a StylizableGroup with key and style.
    ///
    /// - Parameter key: the key
    /// - Parameter style: the style
    public init(_ key: StyleInjectionKey, style: StyleInjection) {
        self.stylizable = (key, style)
    }
    
    /// Build a StylizableGroup with key and style.
    ///
    /// - Parameter stylizable: stylizable instance with key
    public init(_ stylizable: (StyleInjectionKey,StyleInjection)) {
        self.stylizable = stylizable
    }
    
    /// Build a StyleInjectionGroup with resultBuilder.
    public func makeInjectionGroup(@StyleInjectionGroupBuilder make: (Self) -> [StyleInjectionGroup]) ->  [StyleInjectionGroup] {
        make(self)
    }
    
    /// Build a StylizableGroup with key and style.
    ///
    /// - Parameter key: the key
    /// - Parameter style: the style
    public func makeStyle(key: StyleInjectionKey, style: StyleInjection) -> StylizableGroup {
        StylizableGroup(key, style: style)
    }
    
    /// Return style with key.
    ///
    /// - Parameter key: the key
    public func getStylizable(key: StyleInjectionKey) -> StyleInjection? {
        stylizable?.0.keyValue == key.keyValue ? stylizable?.1:nil
    }
    
    /// Apply a style with key and style.
    ///
    /// - Parameter key: the key
    /// - Parameter style: the style
    public func applyStyle<View: UIView>(key: StyleInjectionKey, view: View) {
        stylizable?.1.applyStyle(to: view)
    }
}
