//
//  WindowViewRepresentable.swift
//  WindowView
//
//  Created by Medhat Ibsais on 4/22/21.
//

import UIKit

/// Window View Representable
public class WindowViewRepresentable {
   
    /// First Image
    private(set) var firstImage: UIImage?
    
    /// Second Image
    private(set) var secondImage: UIImage?
    
    /// Icon Image
    private(set) var iconImage: UIImage?
    
    /// Animation
    private(set) var animation: Animations
    
    /// Components Constraints
    private(set) var componentsConstraints: ComponentsConstraints
    
    /**
     Initializer
     */
    public init() {
        self.animation = .unlock(iconImagePinnedObject: .topImage, iconRotationAngle: 190)
        self.componentsConstraints = ComponentsConstraints()
    }
    
    /**
     Initializer
     - Parameter firstImage: Optional UIImage
     - Parameter secondImage: Optional UIImage
     - Parameter iconImage: Optional UIImage
     - Parameter componentsConstraints: Components Constraints
     - Parameter animation: Animations
     */
    public convenience init(firstImage: UIImage?, secondImage: UIImage?, iconImage: UIImage?, componentsConstraints: ComponentsConstraints = ComponentsConstraints(), animation: Animations) {
        self.init()
        
        // Set values
        self.firstImage = firstImage
        self.secondImage = secondImage
        self.iconImage = iconImage
        self.componentsConstraints = componentsConstraints
        self.animation = animation
    }
}
