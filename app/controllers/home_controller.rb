class HomeController < ApplicationController 
  before_action :authenticate_user!, only: [:admin,:userpanel]

# def authenticate_admin!
#   send(:"authenticate_user!"&&current_user.admin?,force: true)
# end

  def index
      @courses = Course.all
  	@chapters = Chapter.all
  	@videos = Video.all
  end

  def admin
  	@courses = Course.all
  	@chapters = Chapter.all
  	@videos = Video.all
      @users = User.all
  end

  def about
  end

  def userpanel
    @comments = Comment.where(user_email:current_user.email)
    @replies = Reply.where(user_email:current_user.email)
    @reviews = Review.where(userinfo:current_user.email)
  end

end
