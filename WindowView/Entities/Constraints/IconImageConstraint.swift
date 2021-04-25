//
//  IconImageConstraint.swift
//  WindowView
//
//  Created by Medhat Ibsais on 4/24/21.
//

import UIKit

/// Icon Image Constraint
public struct IconImageConstraint {
    
    /// CenterX Constraint Constant
    var centerXConstraintConstant: CGFloat = 0
    
    /// CenterY Constraint Constant
    var centerYConstraintConstant: CGFloat = 0
    
    /// Height
    var height: CGFloat = 128
    
    /// Width
    var width: CGFloat = 128
    
    /**
     Initializer
     - Parameter centerXConstraintConstant: CGFloat
     - Parameter centerYConstraintConstant: CGFloat
     - Parameter height: CGFloat
     - Parameter width: CGFloat
     */
    public init(centerXConstraintConstant: CGFloat = 0, centerYConstraintConstant: CGFloat = 0, height: CGFloat = 128, width: CGFloat = 128) {
        
        // Set constraints
        self.centerXConstraintConstant = centerXConstraintConstant
        self.centerYConstraintConstant = centerYConstraintConstant
        self.height = height
        self.width = width
    }
}
