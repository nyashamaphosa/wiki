require 'test_helper'

class ArticleTest < ActiveSupport::TestCase 

	def test_should_not_save_article_without_title
		@article = Article.new
		assert_not @article.valid?, "Article should not save without title and body"
	end 
end 
