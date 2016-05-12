require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { caption: @comment.caption, post_id: @comment.post_id, user_id: @comment.user_id } }
    end

    assert_response 201
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { caption: @comment.caption, post_id: @comment.post_id, user_id: @comment.user_id } }
    assert_response 200
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_response 204
  end
end
