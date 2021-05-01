//
//  Animations.swift
//  WindowView
//
//  Created by Medhat Ibsais on 5/1/21.
//

import UIKit

/// Animations
public enum Animations {
    
    /**
     Roll option
     This option rolls the window up without any animation for the icon image.
     - Parameter iconImagePinnedObject: Optional WindowView.PinIconTo, by default no icon.
     */
    case roll(iconImagePinnedObject: WindowView.PinIconTo?)
    
    /**
     Unlock option
     This option rolls the window up with animation for the icon image.
     - Parameter iconImagePinnedObject: Optional WindowView.PinIconTo, by default no icon.
     - Parameter iconRotationAngle: CGFloat, in order to pass the rotation angle.
     */
    case unlock(iconImagePinnedObject: WindowView.PinIconTo?, iconRotationAngle: CGFloat)
    
    /**
     Custom option
     This option rolls the window up custom animation.
     - Parameter windowAnimation: WindowAnimation
     */
    case custom(windowAnimation: WindowAnimation)
    
    /// Window Animation
    public var windowAnimation: WindowAnimation {
     
        switch self {
        
        // Roll
        case .roll(let iconImagePinnedObject):
            
            // Open window animation settings
            let openWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: 0.5)
            
            // Close window animation settings
            let closeWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: 0)
            
            // Return window animation object
            return WindowAnimation(iconImagePinnedObject: iconImagePinnedObject ?? .noIcon, openWindowAnimationSettings: openWindowAnimationSettings, closeWindowAnimationSettings: closeWindowAnimationSettings)
            
        // Unlock
        case let .unlock(iconImagePinnedObject, iconRotationAngle):
            
            // Rotate icon animation settings
            let rotateIconAnimationSettings = AnimationSettings(duration: 1.5, delay: 0.5)
            
            // Open window animation settings
            let openWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: rotateIconAnimationSettings.fullDuration)
            
            // Close window animation settings
            let closeWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: 0)
            
            // Rotate icon to original animation settings
            let rotateIconToOriginAnimationSettings = AnimationSettings(duration: 1.5, delay: closeWindowAnimationSettings.fullDuration)
            
            // Return window animation object
            return WindowAnimation(iconImagePinnedObject: iconImagePinnedObject ?? .noIcon, iconRotationAngle: iconRotationAngle, rotateIconAnimationSettings: rotateIconAnimationSettings, rotateIconToOriginAnimationSettings: rotateIconToOriginAnimationSettings, openWindowAnimationSettings: openWindowAnimationSettings, closeWindowAnimationSettings: closeWindowAnimationSettings)
            
        // Custom
        case .custom(let windowAnimation):
            return windowAnimation
        }
    }
}
