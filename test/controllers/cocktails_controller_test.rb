require 'test_helper'

class CocktailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cocktail = cocktails(:one)
  end

  test "should get index" do
    get cocktails_url
    assert_response :success
  end

  test "should create cocktail" do
    assert_difference('Cocktail.count') do
      post cocktails_url, params: { cocktail: { name: @cocktail.name, recipe: @cocktail.recipe } }
    end

    assert_response 201
  end

  test "should show cocktail" do
    get cocktail_url(@cocktail)
    assert_response :success
  end

  test "should update cocktail" do
    patch cocktail_url(@cocktail), params: { cocktail: { name: @cocktail.name, recipe: @cocktail.recipe } }
    assert_response 200
  end

  test "should destroy cocktail" do
    assert_difference('Cocktail.count', -1) do
      delete cocktail_url(@cocktail)
    end

    assert_response 204
  end
end
