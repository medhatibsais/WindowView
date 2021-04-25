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
    
    /// Window Animation
    private(set) var windowAnimation: WindowAnimation
    
    /// Components Constraints
    private(set) var componentsConstraints: ComponentsConstraints
    
    /**
     Initializer
     */
    public init() {
        self.windowAnimation = WindowAnimation(iconImagePinnedObject: .topImage)
        self.componentsConstraints = ComponentsConstraints()
    }
    
    /**
     Initializer
     - Parameter firstImage: Optional UIImage
     - Parameter secondImage: Optional UIImage
     - Parameter iconImage: Optional UIImage
     - Parameter componentsConstraints: Components Constraints
     - Parameter windowAnimation: Window Animation
     */
    public convenience init(firstImage: UIImage?, secondImage: UIImage?, iconImage: UIImage?, componentsConstraints: ComponentsConstraints = ComponentsConstraints(), windowAnimation: WindowAnimation = WindowAnimation(iconImagePinnedObject: .topImage)) {
        self.init()
        
        // Set values
        self.firstImage = firstImage
        self.secondImage = secondImage
        self.iconImage = iconImage
        self.windowAnimation = windowAnimation
        self.componentsConstraints = componentsConstraints
    }
}
