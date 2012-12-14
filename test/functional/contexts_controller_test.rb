require 'test_helper'

class ContextsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Context.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Context.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Context.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to context_url(assigns(:context))
  end

  def test_edit
    get :edit, :id => Context.first
    assert_template 'edit'
  end

  def test_update_invalid
    Context.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Context.first
    assert_template 'edit'
  end

  def test_update_valid
    Context.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Context.first
    assert_redirected_to context_url(assigns(:context))
  end

  def test_destroy
    context = Context.first
    delete :destroy, :id => context
    assert_redirected_to contexts_url
    assert !Context.exists?(context.id)
  end
end
