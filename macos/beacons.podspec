#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint beacons.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'beacons'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.11'
  s.source = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.script_phase = {
    :name => 'Build native library',
    :script => 'sh "$PODS_TARGET_SRCROOT/../cargokit/build_pod.sh" ../native/ beacons',
    :execution_position => :before_compile,
    :input_files => ['${BUILT_PRODUCTS_DIR}/cargokit_phony'],
    # Let XCode know that the static library referenced in -force_load below is
    # created by this build step.
    :output_files => ["${BUILT_PRODUCTS_DIR}/libbeacons.a"],
  }
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'OTHER_LDFLAGS' => '-force_load ${BUILT_PRODUCTS_DIR}/libbeacons.a',
  }
  s.swift_version = '5.0'
end
