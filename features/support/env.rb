# Appium lib
require 'appium_lib'
# Unit Test
require 'rspec'
# Debug
require 'pry-byebug'
# Load another supports files
require File.expand_path(File.dirname(__FILE__) + '/../../features/support/utils')
require File.expand_path(File.dirname(__FILE__) + '/../../features/support/driver')


case ENV['PLATFORM'].to_s.upcase
  when 'ANDROID'

  when 'IOS'
    if ENV['DEVICE_NAME'].to_s.empty? || ENV['UDID'].to_s.empty?  || ENV['APP'].to_s.empty?
      puts "Mobile Automation\n\tPlease, fill the parameters:" \
            "\n\t- DEVICE_NAME=<DEVICE_NAME>\n\t- UDID=<DEVICE_UDID>\n\t- APP=<PATH_TO_APP>" \
            "\n\te.q.:"\
            " DEVICE_NAME='iPhone 5s'" \
            " UDID='EA0FEA32-C7E5-428D-9675-366B0A72754E'"\
            " APP='./example.app'"
      exit!
    end
    desired_caps = {
      caps: {
        appiumVersion:    '1.6.4',
        platformName:     'iOS',
        automationName:   'XCUITest',
        # iOS version
        platformVersion:  '10.3.1',
        # Emulator device
        deviceName:       "#{ENV['DEVICE_NAME']}", # 'iPhone 5s',
        udid:             "#{ENV['UDID']}", #'EA0FEA32-C7E5-428D-9675-366B0A72754E',
        app:              "#{ENV['APP']}", # './triangulo-ios.app',
      },
      appium_lib: {
        wait_timeout: 30
      }    
    }
  else
    puts 'Define a plataform'
    exit!
end

# desired_caps = {
  ## Android
  # caps:       {
  #   appiumVersion:    '1.6.4',
  #   platformName:     'Android',
  #   platformVersion:  '4.4',
  #   browserName:       '',
  #   deviceName:       'Samsung Galaxy S4 Emulator',
  #   app:              'http://saucelabs.com/example_files/ContactManager.apk',
  #   name:             'Ruby Appium Sauce example'
  # }

  # # iOS Emulator Device
  # caps: {
  #   appiumVersion:    '1.6.4',
  #   platformName:     'iOS',
  #   platformVersion:  '10.3.1', # iOS version
  #   automationName:   'XCUITest',
  #   # Emulator device
  #   deviceName:        'iPhone 5s',
  #   udid:              'EA0FEA32-C7E5-428D-9675-366B0A72754E',
  #   app:              './triangulo-ios.app',
  # }

  # iOS
#   caps: {
#     appiumVersion:    '1.6.4',
#     # useNewWDA:        'true',
#     platformName:     'iOS',
#     platformVersion:  '10.3.1', # iOS SDK
#     automationName:   'XCUITest',
#
#     ## Phisical device
#     deviceName:       'HBreda iPhone',
#     udid:             '26488e3982c1c81887aec5051a7071cb78f2bb88',
#
#     ## Emulator
#     # deviceName:        'iPhone 5s',
#     # udid:              'EA0FEA32-C7E5-428D-9675-366B0A72754E',
#     autoWebview: true,
#     # xcodeSigningId:   'HBreda iPhone',
#     # name:             'Exemplo',
#     app:              './triangulo-ios.app',
#     # bundleId:         'bredah.triangulo-ios',
#
#     ## Apple identify
#     # xcodeOrgId:         'Henrique Breda',
#     xcodeSigningId:     'iPhone Developer: Henrique Breda (A8ZPA7352X)',
#     browserName:       '',
#     # device:           'iPhone',
#     # deviceName:       'HBreda iPhone',
#     # platformName:     'iOS',
#     # testdroid_target: 'ios',
#
#     ## Appium Capabilities
#     # showXcodeLog:       true,
#     # fullReset:          true,
#     clearSystemFiles:   true,
#     # logLocation:        "./",
#     # bootstrapPath:      '/usr/local/lib/node_modules/appium/node_modules/appium-xcuitest-driver/WebDriverAgent',
#
#   },
#   appium_lib: {
#     wait_timeout: 30
#   }
# }

# Set driver capabilities
$driver = Appium::Driver.new(desired_caps)
# Start driver
$driver.start_driver

# Finish - After scenario
After do |scenario|
    embed($screenshot, "image/png" ) if $screenshot != nil
    $screenshot = nil
end

# Finish - After execution
at_exit do
  # Close driver
  $driver.driver_quit
end
