class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?,only:[:edit,:update,:destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @course = Course.find(params[:course_id])
    @post = @course.posts.build()
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    #@posts = Post.order(:created_at DESC)
    @postss =@post.course.posts
    @posts = @postss.order(updated_at: :DESC)
    @replies=Reply.all.paginate(:page => params[:page],:per_page => 10)
    @reply = @post.replies.build()
    @rereply = Reply.new
    # @rereplyfs = Reply.all.where("parent_id>0")
  end

  # GET /posts/new
  def new
    @post = Post.new
    @course = Course.find(params[:course_id])
    @post.course_id=@course.id
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_email = current_user.email
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '主题创建成功！' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '主题更新成功！' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '主题删除成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :course_id)
    end
end
