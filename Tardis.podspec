Pod::Spec.new do |spec|

  spec.name                 = "Tardis"
  spec.version              = "1.0.0"
  spec.summary              = "A chronology tracker to save and navigate application states."
  spec.description          = "A chronology tracker to save and navigate application states."
  spec.homepage             = "https://github.com/aSlug/Tardis"

  spec.license              = "MIT"
  spec.author               = "aSlug"

  spec.source               = { :git => "https://github.com/aSlug/Tardis.git", :tag => "v1.0.0" }

  spec.source_files         = "Tardis.swift"
  spec.public_header_files  = "Tardis.h"

  spec.swift_version        = "4.2"

end
