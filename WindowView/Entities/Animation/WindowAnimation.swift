//
//  WindowAnimation.swift
//  WindowView
//
//  Created by Medhat Ibsais on 4/23/21.
//

import UIKit

/// Window Animation
public struct WindowAnimation {
    
    /// Rotate Icon Animation Settings
    var rotateIconAnimationSettings: AnimationSettings?
    
    /// Rotate Icon To Origin Animation Settings
    var rotateIconToOriginAnimationSettings: AnimationSettings?
    
    /// Open Window Animation Settings
    var openWindowAnimationSettings: AnimationSettings
    
    /// Close Window Animation Settings
    var closeWindowAnimationSettings: AnimationSettings
    
    /// Icon Image Pinned Object
    var iconImagePinnedObject: WindowView.PinIconTo
    
    /// Icon Rotation Angle
    var iconRotationAngle: CGFloat
    
    /**
     Initializer
     - Parameter iconImagePinnedObject: WindowView.PinIconTo
     - Parameter iconRotationAngle: CGFloat
     - Parameter rotateIconAnimationSettings: Optional AnimationSettings
     - Parameter rotateIconToOriginAnimationSettings: Optional AnimationSettings
     - Parameter openWindowAnimationSettings: AnimationSettings
     - Parameter closeWindowAnimationSettings: AnimationSettings
     */
    public init(iconImagePinnedObject: WindowView.PinIconTo, iconRotationAngle: CGFloat = 0, rotateIconAnimationSettings: AnimationSettings? = nil, rotateIconToOriginAnimationSettings: AnimationSettings? = nil, openWindowAnimationSettings: AnimationSettings = AnimationSettings(), closeWindowAnimationSettings: AnimationSettings = AnimationSettings()) {
        
        // Set icon image pinned object
        self.iconImagePinnedObject = iconImagePinnedObject
        
        // Set icon rotation angle
        self.iconRotationAngle = iconRotationAngle
        
        // Check if there is no icon option has been set
        if iconImagePinnedObject == .noIcon {
            
            // Set only the open and close window animations settings
            self.openWindowAnimationSettings = openWindowAnimationSettings
            self.closeWindowAnimationSettings = closeWindowAnimationSettings
            
            return
        }
        
        // Set animations settings
        self.rotateIconAnimationSettings = rotateIconAnimationSettings
        self.openWindowAnimationSettings = openWindowAnimationSettings
        self.closeWindowAnimationSettings = closeWindowAnimationSettings
        self.rotateIconToOriginAnimationSettings = rotateIconToOriginAnimationSettings
    }
}
