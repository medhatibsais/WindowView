//
//  ViewController.swift
//  WindowViewExampleWithLogin
//
//  Created by Medhat Ibsais on 4/25/21.
//

import UIKit
import WindowView

class ViewController: UIViewController {

    var windowView: WindowView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let loginView = LoginView()
        loginView.delegate = self
        loginView.translatesAutoresizingMaskIntoConstraints = false
                        
        self.windowView = WindowView(frame: self.view.frame)
        self.view.addSubview(self.windowView)
        self.windowView.delegate = self
        
        self.windowView.translatesAutoresizingMaskIntoConstraints = false
        
        self.windowView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.windowView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.windowView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.windowView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        self.windowView.firstImageView.addSubview(loginView)
        loginView.topAnchor.constraint(equalTo: self.windowView.firstImageView.topAnchor, constant: 50).isActive = true
        loginView.leftAnchor.constraint(equalTo: self.windowView.firstImageView.leftAnchor).isActive = true
        loginView.rightAnchor.constraint(equalTo: self.windowView.firstImageView.rightAnchor).isActive = true
        loginView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        let rotateIconAnimationSettings = AnimationSettings(duration: 1.5, delay: 0.5)
        let openWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: rotateIconAnimationSettings.fullDuration)
        let closeWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: 0)
        let rotateIconToOriginAnimationSettings = AnimationSettings(duration: 1.5, delay: closeWindowAnimationSettings.fullDuration)
        
        let windowAnimation = WindowAnimation(iconImagePinnedObject: .topImage, iconRotationAngle: 190, rotateIconAnimationSettings: rotateIconAnimationSettings, rotateIconToOriginAnimationSettings: rotateIconToOriginAnimationSettings, openWindowAnimationSettings: openWindowAnimationSettings, closeWindowAnimationSettings: closeWindowAnimationSettings)
        
        let iconImageConstraint = IconImageConstraint(centerXConstraintConstant: 0, centerYConstraintConstant: 0, height: 128, width: 128)
        
        let componentsConstraints = ComponentsConstraints(iconConstraints: iconImageConstraint)
        
//        self.windowView.firstImageView.backgroundColor = .gray
//        self.windowView.secondImageView.backgroundColor = .white
        
        self.windowView.setup(with: WindowViewRepresentable(firstImage: UIImage(named: "backgroundImage")!, secondImage: UIImage(named: "backgroundImage")!, iconImage: UIImage(named: "JustChatLogo")!, componentsConstraints: componentsConstraints, animation: Animations.unlock(iconImagePinnedObject: .topImage, iconRotationAngle: 190)))
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        self.windowView.close()
    }


}

extension ViewController: WindowViewDelegate {
    
    func windowViewDidOpen() {
    }
    
    func windowViewDidClose() {
        
        print("Closed")
        
    }
    
    func windowViewWillOpen() {
        
    }
    
    func windowViewWillClose() {
        
    }
}

extension ViewController: LoginViewDelegate {
    
    func didClickLogin() {
        
        self.windowView.open()
    }
}
