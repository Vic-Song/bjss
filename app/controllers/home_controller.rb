class HomeController < ApplicationController 
  before_action :is_admin?, only: [:admin]
  before_action :is_user?,only:[:userpanel]

 def is_admin?
   redirect_to home_index_path, notice: 'Please sign in before proceeding' unless user_signed_in?&&current_user.admin?
 end
 def is_user?
    redirect_to home_index_path, notice: 'Please sign in before proceeding'  unless user_signed_in?
 end

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
      @user = User.new(email:params[:email],password:params[:password])
      @comments = Comment.order(:video_id)
  end

  def about
  end

  def userpanel
    @comments = Comment.where(user_email:current_user.email)
    @replies = Reply.where(user_email:current_user.email)
    @records = Record.where(userinfo:current_user.email)
    @histories = History.where(userinfo:current_user.email)
  end

end
