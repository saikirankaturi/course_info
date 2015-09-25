class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter  :verify_authenticity_token

private
  def all_articles
	@all_articles = Article.all
	@all_users = User.all
	@all_posts = Post.all
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user, :all_articles, :all_users, :all_posts
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
