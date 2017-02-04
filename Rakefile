# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

require 'rubygems'
require 'motion-cocoapods'


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'fabric-test-app'

  app.development do
    app.codesign_certificate = "iPhone Developer: Me"
    app.provisioning_profile = 'dev.mobileprovision'
  end

  fabric_api_key = "api-key"
  fabric_build_secret = "secret"
  app.fabric do |config|
    config.api_key = fabric_api_key
    config.build_secret = fabric_build_secret
    config.kit 'Crashlytics'
  end
end


# Upload the dSYM after creating a release build
Rake::Task["archive:distribution"].enhance do
  Rake::Task["fabric:dsym:device"].invoke
end

# Upload the dSYM after every simulator build
Rake::Task["build:simulator"].enhance do
  Rake::Task["fabric:dsym:simulator"].invoke
end

# Upload the dSYM after every device build
Rake::Task["build:device"].enhance do
  Rake::Task["fabric:dsym:device"].invoke
end

# Upload the dSYM after uploading a beta build to Crashlytics
Rake::Task["fabric:upload"].enhance do
  Rake::Task["fabric:dsym:device"].invoke
end
