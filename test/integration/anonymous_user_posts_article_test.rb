require 'test_helper'

class AnonymousUserPostsArticleTest < ActionDispatch::IntegrationTest
  test "posting_a_new_article" do
    visit "/"
    click_link "Write Post"
    fill_in "Title", with: "My First Post!!"
    fill_in "Body", with: "I don't have anything to say"
    click_button "Submit Post"
    assert_include page.body, "Your post has now been published!"
    visit "/posts"
    assert_include page.body, "My First Post!!"
  end
end
