//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 29/05/22.
//

import Foundation

// MARK: - StyleInjectionGroupFactory.
public protocol StyleInjectionGroupFactory {
    associatedtype StyleKey: RawRepresentable where StyleKey.RawValue: StringProtocol
}
