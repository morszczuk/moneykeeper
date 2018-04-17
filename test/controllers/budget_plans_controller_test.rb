require 'test_helper'

class BudgetPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get budget_plans_create_url
    assert_response :success
  end

  test "should get index" do
    get budget_plans_index_url
    assert_response :success
  end

end
