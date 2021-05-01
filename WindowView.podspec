Pod::Spec.new do |spec|

  spec.name         = "WindowView"
  spec.version      = "1.2.1"
  spec.summary      = "WindowView is a dependency to implement window sliding view to open your app with some interacting, exciting, and wonderful animations"

  spec.description  = <<-DESC
    WindowView is a dependency to implement window sliding view to open your app with some interacting, exciting, and wonderful animations.
    You can append login view to it in order to sign in and open the window view.
                   DESC

  spec.homepage     = "https://github.com/medhatibsais/WindowView"

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Medhat Ibsais" => "madhatibsais1@gmail.com" }

  spec.ios.deployment_target = "10.0"
  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/medhatibsais/WindowView.git", :tag => "#{spec.version}" }

  spec.source_files  = "WindowView/**/*.{swift}"
  spec.resources     = "WindowView/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  
end
