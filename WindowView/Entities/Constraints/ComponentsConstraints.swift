//
//  ComponentsConstraints.swift
//  WindowView
//
//  Created by Medhat Ibsais on 4/25/21.
//

import Foundation

/// Components Constraints
public struct ComponentsConstraints {
    
    /// Icon Constraints
    var iconConstraints: IconImageConstraint
    
    /**
     Initializer
     - Parameter iconConstraints: IconImageConstraint
     */
    public init(iconConstraints: IconImageConstraint = IconImageConstraint()) {
        self.iconConstraints = iconConstraints
    }
}
