Pod::Spec.new do |s|
    s.name              = "SwiftyUserDefaults+Namespaces"
    s.version           = ENV["LIB_VERSION"] || "1.0.0"
    s.summary           = "Handy SwiftyUserDefaults extension which provides namespaces support"
    s.homepage          = "https://github.com/ky1vstar/SwiftyUserDefaults-Namespaces"
    s.license           = { :type => "MIT", :file => "LICENSE" }
    s.author            = { "ky1vstar" => "general@ky1vstar.dev" }
    s.source            = { :git => "https://github.com/ky1vstar/SwiftyUserDefaults-Namespaces.git", :tag => s.version.to_s }
    
    s.swift_version     = '5.0'
    s.requires_arc      = true
    s.platforms         = { :ios => "9.0", :osx => "10.11", :watchos => "2.0", "tvos" => "9.0" }
    
    s.frameworks        = ["Foundation"]
    s.dependency          "SwiftyUserDefaults"
    s.source_files      = "Sources/SwiftyUserDefaults+Namespaces/**/*.swift"
end
