require 'test_helper'

class InputformsControllerTest < ActionController::TestCase
  setup do
    @inputform = inputforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inputforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inputform" do
    assert_difference('Inputform.count') do
      post :create, inputform: { annual_inc: @inputform.annual_inc, dti: @inputform.dti, emp_length: @inputform.emp_length, fico_range_high: @inputform.fico_range_high, fico_range_low: @inputform.fico_range_low, grade: @inputform.grade, installment: @inputform.installment, loan_amnt: @inputform.loan_amnt, number_inq_last_6months: @inputform.number_inq_last_6months }
    end

    assert_redirected_to inputform_path(assigns(:inputform))
  end

  test "should show inputform" do
    get :show, id: @inputform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inputform
    assert_response :success
  end

  test "should update inputform" do
    patch :update, id: @inputform, inputform: { annual_inc: @inputform.annual_inc, dti: @inputform.dti, emp_length: @inputform.emp_length, fico_range_high: @inputform.fico_range_high, fico_range_low: @inputform.fico_range_low, grade: @inputform.grade, installment: @inputform.installment, loan_amnt: @inputform.loan_amnt, number_inq_last_6months: @inputform.number_inq_last_6months }
    assert_redirected_to inputform_path(assigns(:inputform))
  end

  test "should destroy inputform" do
    assert_difference('Inputform.count', -1) do
      delete :destroy, id: @inputform
    end

    assert_redirected_to inputforms_path
  end
end
