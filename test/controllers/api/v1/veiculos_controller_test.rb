require 'test_helper'

class Api::V1::VeiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_veiculo = api_v1_veiculos(:one)
  end

  test "should get index" do
    get api_v1_veiculos_url, as: :json
    assert_response :success
  end

  test "should create api_v1_veiculo" do
    assert_difference('Api::V1::Veiculo.count') do
      post api_v1_veiculos_url, params: { api_v1_veiculo: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_veiculo" do
    get api_v1_veiculo_url(@api_v1_veiculo), as: :json
    assert_response :success
  end

  test "should update api_v1_veiculo" do
    patch api_v1_veiculo_url(@api_v1_veiculo), params: { api_v1_veiculo: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_veiculo" do
    assert_difference('Api::V1::Veiculo.count', -1) do
      delete api_v1_veiculo_url(@api_v1_veiculo), as: :json
    end

    assert_response 204
  end
end
