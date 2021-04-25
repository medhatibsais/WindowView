Pod::Spec.new do |spec|

  spec.name         = "WindowView"
  spec.version      = "1.0"
  spec.summary      = "WindowView is a dependency to implement window sliding view to open your app with some interacting, exciting, and wonderful animations"

  spec.description  = <<-DESC
    WindowView is a dependency to implement window sliding view to open your app with some interacting, exciting, and wonderful animations.
    You can append login view to it in order to sign in and open the window view.
                   DESC

  spec.homepage     = "https://github.com/medhatibsais/WindowView"
  spec.screenshots  = "https://github.com/medhatibsais/WindowView/blob/master/Videos/video1.gif", "https://github.com/medhatibsais/WindowView/blob/master/Videos/video2.gif",
    "https://github.com/medhatibsais/WindowView/blob/master/Videos/video3.gif",
    "https://github.com/medhatibsais/WindowView/blob/master/Videos/video4.gif"

  spec.license      = { :type => "MIT", :file => "https://github.com/medhatibsais/WindowView/blob/main/LICENSE" }

  spec.author             = { "Medhat Ibsais" => "madhatibsais1@gmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/madhat-ibsais/"

  spec.ios.deployment_target = "10.0"
  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/medhatibsais/WindowView", :tag => "#{spec.version}" }

  spec.source_files  = "WindowView/**/*.{h,m, swift}"
  
end
