import Foundation
import UIKit

// MARK: - StyleInjection.
public protocol StyleInjection {
    /// Apply this style to a UIView.
    ///
    /// - Parameter style: the function to style
    func applyStyle<View: UIView>(to view: View)
    
    /// Apply this style to multiple views.
    ///
    /// - Parameter views: the views to style
    func applyStyle<View: UIView>(to view: View...)
}

public extension StyleInjection {
    /// Static instance of UIViewStyle.
    static var stylizable: Stylizable<Self> { Stylizable() }
}

// MARK: - StyleInjection.
public extension StyleInjection {
    /// Apply value from keypath.
    ///
    /// - Parameter keyPath: the views keypath
    /// - Parameter newValue: the value of keypath
    @discardableResult
    func set<Value>(_ keyPath:ReferenceWritableKeyPath<Self, Value>,to newValue: Value) -> Self {
        self[keyPath: keyPath] = newValue
        return self
    }
    
    /// Apply value from keypath.
    ///
    /// - Parameter keyPath: the views keypath
    /// - Parameter newValue: the value of keypath
    @discardableResult
    mutating func set<Value>(_ keyPath:WritableKeyPath<Self, Value>,to newValue: Value) -> Self {
        self[keyPath: keyPath] = newValue
        return self
    }
}

// MARK: - UIView.
extension UIView: StyleInjection {
    /// Apply this style to a UIView.
    ///
    /// - Parameter style: the function to style
    public func applyStyle<View>(to view: View) { }
    
    /// Apply this style to multiple views.
    ///
    /// - Parameter views: the views to style
    public func applyStyle<View>(to view: View...) { }
}
