//
//  AnimationSettings.swift
//  WindowView
//
//  Created by Medhat Ibsais on 4/23/21.
//

import Foundation

/// Animation Settings
public struct AnimationSettings {
    
    /// Delay
    public var delay: TimeInterval
    
    /// Duration
    public var duration: TimeInterval
    
    /// Full Duration
    public var fullDuration: TimeInterval {
        return self.duration + self.delay
    }
    
    /**
     Initializer
     - Parameter duration: TimeInterval
     - Parameter delay: TimeInterval
     */
    public init(duration: TimeInterval = 0, delay: TimeInterval = 0) {
        self.delay = delay
        self.duration = duration
    }
}
