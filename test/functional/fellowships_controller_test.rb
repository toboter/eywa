require 'test_helper'

class FellowshipsControllerTest < ActionController::TestCase
  def test_create_invalid
    Fellowship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Fellowship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_destroy
    fellowship = Fellowship.first
    delete :destroy, :id => fellowship
    assert_redirected_to root_url
    assert !Fellowship.exists?(fellowship.id)
  end
end
