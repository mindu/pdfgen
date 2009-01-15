require 'test_helper'

class ProdutosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:produtos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_produto
    assert_difference('Produto.count') do
      post :create, :produto => { }
    end

    assert_redirected_to produto_path(assigns(:produto))
  end

  def test_should_show_produto
    get :show, :id => produtos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => produtos(:one).id
    assert_response :success
  end

  def test_should_update_produto
    put :update, :id => produtos(:one).id, :produto => { }
    assert_redirected_to produto_path(assigns(:produto))
  end

  def test_should_destroy_produto
    assert_difference('Produto.count', -1) do
      delete :destroy, :id => produtos(:one).id
    end

    assert_redirected_to produtos_path
  end
end
