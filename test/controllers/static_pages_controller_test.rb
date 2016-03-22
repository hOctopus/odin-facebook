require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Odin Facebook | Facebook for Odin"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Odin Facebook | Help"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "Odin Facebook | About"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Odin Facebook | Contact"
  end

end
