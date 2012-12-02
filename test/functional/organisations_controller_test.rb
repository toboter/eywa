require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Organisation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Organisation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Organisation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to organisation_url(assigns(:organisation))
  end

  def test_edit
    get :edit, :id => Organisation.first
    assert_template 'edit'
  end

  def test_update_invalid
    Organisation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Organisation.first
    assert_template 'edit'
  end

  def test_update_valid
    Organisation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Organisation.first
    assert_redirected_to organisation_url(assigns(:organisation))
  end

  def test_destroy
    organisation = Organisation.first
    delete :destroy, :id => organisation
    assert_redirected_to organisations_url
    assert !Organisation.exists?(organisation.id)
  end
end
