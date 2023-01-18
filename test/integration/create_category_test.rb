require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do

    @admin_user = User.create( username: "adminsser", email:"adminuser@gmail.com", password:"123456",admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get new_category_url  #or get "/categories/new"
    assert_response :success
    assert_difference('Category.count',1) do
      post categories_url, params: { category: { name: "Health "  } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Health", response.body

  end

  test "get new category form and reject invalid category submission" do
    get new_category_url  #or get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_url, params: { category: { name: " "  } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'

  end
end
