class KpPostsController < ApplicationController
  before_action :set_kp_post, only: %i[ show edit update destroy ]
  before_action :authenticate_kp_user!, except: %i[ index ]
  before_action only: [:new, :create] do
    authorize_request(["kp_admin"])
  end

  # GET /kp_posts or /kp_posts.json
  def index
    @kp_posts = KpPost.all
  end

  # GET /kp_posts/1 or /kp_posts/1.json
  def show
    @kp_post = KpPost.find(params[:id])
    @kp_comments = @kp_post.kp_comments
    @kp_comment = KpComment.new
  end

  # GET /kp_posts/new
  def new
    @kp_post = KpPost.new
  end

  # GET /kp_posts/1/edit
  def edit
  end

  # POST /kp_posts or /kp_posts.json
  def create
    @kp_post = KpPost.new(kp_post_params)
    @kp_post.kp_user = current_kp_user
    @kp_post.kp_image.attach(params[:kp_post][:kp_image])

    respond_to do |format|
      if @kp_post.save
        format.html { redirect_to kp_post_url(@kp_post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @kp_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kp_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kp_posts/1 or /kp_posts/1.json
  def update
    respond_to do |format|
      if @kp_post.update(kp_post_params)
        format.html { redirect_to kp_post_url(@kp_post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @kp_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kp_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kp_posts/1 or /kp_posts/1.json
  def destroy
    @kp_post.destroy

    respond_to do |format|
      format.html { redirect_to kp_posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kp_post
      @kp_post = KpPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kp_post_params
      params.require(:kp_post).permit(:kp_user_id, :image_legend, kp_image: [])
    end
end
