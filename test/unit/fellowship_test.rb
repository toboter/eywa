require 'test_helper'

class FellowshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Fellowship.new.valid?
  end
end
