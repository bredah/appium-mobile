module Driver

  # Execute touch event
  def self.touch(element)
    find_element(element).click
  end

  # Execute send text event
  def self.send_keys(element, text)
    find_element(element).send_keys text
  end

  # Retrieve element text
  def self.get_text(element)
    find_element(element).text
  end

  # Check if the element is displayed
  def self.displayed(element)
    find_element(element).displayed?
  end

  # Take screenshot from app
  def self.screenshot
    $screenshot = File.expand_path(File.dirname(__FILE__) + '/../../') + '/' + Time.now.strftime('%Y-%m-%d_%H-%M-%S-%L') + '.png'
    $driver.screenshot $screenshot
  end

  # Find the element on current app
  def self.find_element(element)
    $driver.find_element(element[:by], element[:value])
  end

  private_class_method :find_element
end
