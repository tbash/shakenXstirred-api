require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { caption: @post.caption, user_id: @post.user_id } }
    end

    assert_response 201
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { caption: @post.caption, user_id: @post.user_id } }
    assert_response 200
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_response 204
  end
end
