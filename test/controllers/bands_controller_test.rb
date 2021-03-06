require "test_helper"

class BandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @band = bands(:one)
  end

  test "should get index" do
    get bands_url, as: :json
    assert_response :success
  end

  test "should create band" do
    assert_difference('Band.count') do
      post bands_url, params: { band: { genre_id: @band.genre_id, name: @band.name, status_id: @band.status_id, user_id: @band.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show band" do
    get band_url(@band), as: :json
    assert_response :success
  end

  test "should update band" do
    patch band_url(@band), params: { band: { genre_id: @band.genre_id, name: @band.name, status_id: @band.status_id, user_id: @band.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy band" do
    assert_difference('Band.count', -1) do
      delete band_url(@band), as: :json
    end

    assert_response 204
  end
end
