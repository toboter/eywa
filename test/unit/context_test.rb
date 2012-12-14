require 'test_helper'

class ContextTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Context.new.valid?
  end
end
