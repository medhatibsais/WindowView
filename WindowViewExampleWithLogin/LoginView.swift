//
//  LoginView.swift
//  WindowViewExampleWithLogin
//
//  Created by Medhat Ibsais on 4/25/21.
//

import UIKit

class LoginView: UIView {

    @IBOutlet var parentView: UIView!
    weak var delegate: LoginViewDelegate?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initViews()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.initViews()
    }
    
    private func initViews() {
        
        let bundle = Bundle(for: LoginView.self)
        
        bundle.loadNibNamed(String(describing: LoginView.self), owner: self, options: nil)
        self.addSubview(self.parentView)
        self.parentView.frame = self.frame
        self.parentView.backgroundColor = .clear
    }
    
    @IBAction func loginButton(_ sender: Any) {
        self.delegate?.didClickLogin()
        
        
    }
    
}

protocol LoginViewDelegate: NSObjectProtocol {
    
    func didClickLogin()
    
}
