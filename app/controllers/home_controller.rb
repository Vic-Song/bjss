class HomeController < ApplicationController 
  before_action :is_admin?, only: [:admin]
  before_action :is_user?,only:[:userpanel]

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
    @historyf = @histories.first
    @historyl = @histories.last
    @time = Time.now.midnight
    # @histories.each do |h|
    #   if Video.find(id:h.videoinfo).blank?
    #     h.destroy
    #   else
    #   return h
    # end
    # end

    @days = Array.new
    i = 0
    @histories.each do |h|
      @days[i] = ((@time - h.viewtime)/86400).ceil
      i = i+1
    end

    @hfday = ((@time - @historyf.viewtime)/86400).ceil
    @hlday = ((@time - @historyl.viewtime)/86400).ceil
  end

end
