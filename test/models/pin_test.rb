require 'test_helper'

class PinTest < ActiveSupport::TestCase
  test "create valid pin" do
    pin = Pin.new(id: 1, title: "asdcasdc") 
    # puts pin
    # puts "=========================="
    # puts pin.valid?
    # puts "=========================="
    assert pin.valid?
  end

  test "invalid pin creation" do
    pin = Pin.new(id: 1)
    # puts pin.valid?
    assert_not pin.valid?
  end
end
