require 'test_helper'

class AnonymousUserBrowsesArticleTest < ActionDispatch::IntegrationTest

  test "page_includes_title_and_body_content" do
    Post.create(title: "My First Post", body: "This could be the start of something special.")
    Post.create(title: "My Second Post", body: "Nope. Still nothing special.")
    visit '/posts'
    assert_equal 2, Post.count
    assert_include page.body, "All Posts"
    assert_include page.body, "My First Post"
    assert_include page.body, "My Second Post"
  end

end