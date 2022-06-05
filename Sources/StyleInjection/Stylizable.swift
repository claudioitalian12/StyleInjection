//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 29/05/22.
//

import Foundation

// MARK: - Stylizable.
public struct Stylizable<ViewStyle>: StyleInjection {
    /// The styling function that takes a `UIView` instance
    /// and performs side-effects on it.
    public var style: ((ViewStyle)-> Void)?
    
    /// Build a UIViewStyle with style.
    ///
    /// - Parameter style: the function to style
    public func buildStyle(style: ((ViewStyle)-> Void)?) -> StyleInjection {
        Stylizable(style: style)
    }
    
    /// Apply this style to a UIView.
    ///
    /// - Parameter view: the view to style
    public func applyStyle<View>(to view: View) {
        guard let view = view as? ViewStyle else { return }
        style?(view)
    }
    
    /// Apply this style to multiple views.
    ///
    /// - Parameter views: the views to style
    public func applyStyle<View>(to views: View...) {
        views.forEach { view in
            applyStyle(to: view)
        }
    }
}

