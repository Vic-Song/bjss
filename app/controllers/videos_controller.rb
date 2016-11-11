class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :historize, only: [:show]
  before_action :is_admin?,only:[:edit,:update,:destroy]
  # respond_to :json :html

  def historize
    if user_signed_in?
      Time.zone = 'Beijing'
    @time = Time.now.in_time_zone
    @userinfo = current_user.email
    @video = Video.find(params[:id])
    @history = History.new(userinfo:@userinfo,viewtime:@time,videoinfo:@video.id)
    redirect_to home_index_path unless @history.save
    else
      #do nothing
    end
  end

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
    @comments = Comment.all.paginate(:page => params[:page],:per_page => 10)
    @comment = @video.comments.build()
  end

  def download
    @video = Video.find(params[:id])
    send_file "#{Rails.root}/public/#{@video.video_url_url}",type:"video/mp4"
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    chapter_id= @video.chapter_id
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to home_admin_path, notice: '视频创建成功！' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to home_admin_path, notice: '视频更新成功！' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to home_admin_path, notice: '视频删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :description, :video_url, :duration, :author, :chapter_id)
    end
end
