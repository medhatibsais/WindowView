//
//  WindowView.swift
//  WindowView
//
//  Created by Medhat Ibsais on 4/22/21.
//

import UIKit

/// Window View
public class WindowView: UIView {
    
    /// Pin Icon To
    public enum PinIconTo {
        case topImage
        case bottomImage
        case noIcon
    }
    

    /// Parent View
    @IBOutlet weak private var parentView: UIView!
    
    /// First Image View
    @IBOutlet weak public var firstImageView: UIImageView!
    
    /// Second Image View
    @IBOutlet weak public var secondImageView: UIImageView!
    
    /// Icon Image View
    @IBOutlet weak public var iconImageView: UIImageView!
    
    /// First Image View Top Constraint
    @IBOutlet weak private var firstImageViewTopConstraint: NSLayoutConstraint!
    
    /// Second Image View Bottom Constraint
    @IBOutlet weak private var secondImageViewBottomConstraint: NSLayoutConstraint!
    
    /// Icon Image View CenterY Constraint
    @IBOutlet weak private var iconImageViewCenterYConstraint: NSLayoutConstraint!
    
    /// Icon Image View CenterX Constraint
    @IBOutlet weak private var iconImageViewCenterXConstraint: NSLayoutConstraint!
    
    /// Icon Image View Height Constraint
    @IBOutlet weak private var iconImageViewHeightConstraint: NSLayoutConstraint!
    
    /// Icon Image View Width Constraint
    @IBOutlet weak private var iconImageViewWidthConstraint: NSLayoutConstraint!
    
    /// Animation
    private var animation: Animations = .unlock(iconImagePinnedObject: .topImage, iconRotationAngle: 190)
    
    /// Components Constraints
    private var componentsConstraints = ComponentsConstraints()
    
    /// Delegate
    public weak var delegate: WindowViewDelegate?
    
    /**
     Initializer
     - Parameter frame: CGRect
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        // Init Views
        self.initViews()
    }

    /**
     Initializer
     - Parameter coder: NSCoder
     */
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // Init Views
        self.initViews()
    }
    
    /**
     Init Views
     */
    private func initViews() {
        
        // Get window view bundle
        let bundle = Bundle(for: WindowView.self)
        
        // Load nib file
        bundle.loadNibNamed(String(describing: WindowView.self), owner: self, options: nil)
        
        // Customize window view
        self.addSubview(self.parentView)
        self.parentView.frame = self.frame
        self.parentView.backgroundColor = .clear
    }
    
    /**
     Setup
     - Parameter representable: Window View Representable
     */
    public func setup(with representable: WindowViewRepresentable) {
        
        // Set window animation
        self.animation = representable.animation
        
        // Set components constraints
        self.componentsConstraints = representable.componentsConstraints
        
        // Set images
        self.firstImageView.image = representable.firstImage
        self.secondImageView.image = representable.secondImage
        self.iconImageView.image = representable.iconImage
        
        // Remove icon image if the option is no icon
        if self.animation.windowAnimation.iconImagePinnedObject == .noIcon {
            self.iconImageView.removeFromSuperview()
        }
        else {
            
            // Set icon image constraints
            self.iconImageViewHeightConstraint.constant = representable.componentsConstraints.iconConstraints.height
            self.iconImageViewWidthConstraint.constant = representable.componentsConstraints.iconConstraints.width
            self.iconImageViewCenterXConstraint.constant = representable.componentsConstraints.iconConstraints.centerXConstraintConstant
            self.iconImageViewCenterYConstraint.constant = representable.componentsConstraints.iconConstraints.centerYConstraintConstant
        }
    }
    
    /**
     Open
     */
    public func open() {
        
        // End view editing
        self.endEditing(true)
        
        // Layout if needed
        self.layoutIfNeeded()
        
        // Call will open
        self.delegate?.windowViewWillOpen()
        
        // Check if the view has icon animation option
        if self.animation.windowAnimation.iconRotationAngle != 0, let rotateIconAnimationSettings = self.animation.windowAnimation.rotateIconAnimationSettings, self.iconImageView != nil {
         
            // Set transform to identity
            self.iconImageView.layer.transform = CATransform3DIdentity
            
            // Animate icon rotation
            UIView.animate(withDuration: rotateIconAnimationSettings.duration, delay: rotateIconAnimationSettings.delay, options: .curveEaseOut, animations: {
                
                // Set transform to icon rotation value around z axis
                self.iconImageView.layer.transform = CATransform3DMakeRotation(self.animation.windowAnimation.iconRotationAngle, 0, 0, 1)
                
            }, completion: { _ in })
        }
        
        // Check icon image pinned object
        switch self.animation.windowAnimation.iconImagePinnedObject {
        
        // Top image
        case .topImage:
            
            // Top image height value
            var topImageHeightValue = (self.firstImageView.frame.size.height + self.iconImageView.frame.size.height / 2)
            
            // Add the icon image center y constraint constant if its greater than 0
            if self.componentsConstraints.iconConstraints.centerYConstraintConstant > 0 {
                topImageHeightValue += self.componentsConstraints.iconConstraints.centerYConstraintConstant
            }

            // Set constraints constants
            self.firstImageViewTopConstraint.constant -= topImageHeightValue
            self.secondImageViewBottomConstraint.constant -= self.secondImageView.frame.size.height
            self.iconImageViewCenterYConstraint.constant -= topImageHeightValue
            
        // Bottom image
        case .bottomImage:
            
            // Bottom image height value
            var bottomImageHeightValue = (self.secondImageView.frame.size.height + self.iconImageView.frame.size.height / 2)
            
            // Add the icon image center y constraint constant if its less than 0
            if self.componentsConstraints.iconConstraints.centerYConstraintConstant < 0 {
                bottomImageHeightValue += (self.secondImageView.frame.size.height + self.iconImageView.frame.size.height / 2 + abs(self.componentsConstraints.iconConstraints.centerYConstraintConstant))
            }
            
            // Set constraints constants
            self.firstImageViewTopConstraint.constant -= self.firstImageView.frame.size.height
            self.secondImageViewBottomConstraint.constant -= bottomImageHeightValue
            self.iconImageViewCenterYConstraint.constant += bottomImageHeightValue
            
        // No icon
        case .noIcon:
            self.firstImageViewTopConstraint.constant -= self.firstImageView.frame.size.height
            self.secondImageViewBottomConstraint.constant -= self.secondImageView.frame.size.height
        }
        
        // Animate
        UIView.animate(withDuration: self.animation.windowAnimation.openWindowAnimationSettings.duration, delay: self.animation.windowAnimation.openWindowAnimationSettings.delay, options: .curveEaseOut, animations: {
            
            // Layout if needed
            self.layoutIfNeeded()
            
        }, completion: { [weak self] _ in
            
            // Self
            guard let self = self else { return }
            
            // Set is hidden to true
            self.isHidden = true
            
            // Call did open
            self.delegate?.windowViewDidOpen()
        })
    }
    
    /**
     Close
     */
    public func close() {
        
        // Call will close delegate
        self.delegate?.windowViewWillClose()
        
        // Set is hidden to false
        self.isHidden = false
        
        // Set top and bottom constraints to zero
        self.firstImageViewTopConstraint.constant = 0
        self.secondImageViewBottomConstraint.constant = 0
        
        // Set icon center y constraint if the constraint is not nil
        if self.iconImageViewCenterYConstraint != nil {
            self.iconImageViewCenterYConstraint.constant = self.componentsConstraints.iconConstraints.centerYConstraintConstant
        }
        
        // Has icon animation option
        let hasIconAnimationOption: Bool = self.animation.windowAnimation.iconRotationAngle != 0 && self.animation.windowAnimation.rotateIconToOriginAnimationSettings != nil && self.iconImageView != nil
        
        // Animate close
        UIView.animate(withDuration: self.animation.windowAnimation.closeWindowAnimationSettings.duration, delay: self.animation.windowAnimation.closeWindowAnimationSettings.delay, options: .curveEaseOut, animations: {
            
            // Layout if needed
            self.layoutIfNeeded()
            
        }, completion: { [weak self, hasIconAnimationOption] _ in

            // Self
            guard let self = self else { return }
            
            // Call did close if the view does not have icon animation option
            if !hasIconAnimationOption {
                self.delegate?.windowViewDidClose()
            }
        })
        
        // Check if the view has icon animation option
        if hasIconAnimationOption {
         
            // Rotate icon to origin animation settings
            let rotateIconToOriginAnimationSettings = self.animation.windowAnimation.rotateIconToOriginAnimationSettings!
            
            // Animate icon rotation
            UIView.animate(withDuration: rotateIconToOriginAnimationSettings.duration, delay: rotateIconToOriginAnimationSettings.delay, options: .curveEaseOut, animations: {
                
                // Set transform to identity
                self.iconImageView.layer.transform = CATransform3DIdentity
                
            }, completion: { [weak self] _ in
                
                // Self
                guard let self = self else { return }
                
                // Call did close
                self.delegate?.windowViewDidClose()
                
            })
        }
    }
}

/// Window View Delegate
public protocol WindowViewDelegate: NSObjectProtocol {
    
    /**
     Window View Will Open
     */
    func windowViewWillOpen()
    
    /**
     Window View Did Open
     */
    func windowViewDidOpen()
    
    /**
     Window View Will Close
     */
    func windowViewWillClose()
    
    /**
     Window View Did Close
     */
    func windowViewDidClose()
}
