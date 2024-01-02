#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_joystick_customisable.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_joystick_customisable'
  s.version          = '0.1.0'
  s.summary          = 'A Flutter plugin for joystick with customisable options.'
  s.description      = <<-DESC
A Flutter plugin for joystick with customisable options.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Devendran Radhakrishnan' => 'trdevendran@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
