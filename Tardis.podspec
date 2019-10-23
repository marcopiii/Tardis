Pod::Spec.new do |spec|

  spec.name                 = "Tardis"
  spec.version              = "1.0.1"
  spec.summary              = "A super lite chronology tracker to save and navigate application states (or any data you want)."
  spec.description          = "Tardis allows you to save, keep track and navigate snapshots of your application state (or whatever else you want) with a concise syntax"
  spec.homepage             = "https://github.com/aSlug/Tardis"

  spec.license              = "MIT"
  spec.platform             = :ios, "12.0"

  spec.author               = "aSlug"

  spec.source               = { :git => "https://github.com/aSlug/Tardis.git", :tag => "v1.0.1" }

  spec.source_files         = "Tardis/Tardis.swift"

  spec.swift_version        = "4.2"

end
