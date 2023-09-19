class KpCommentsController < ApplicationController
  before_action :set_kp_comment, only: %i[ show edit update destroy ]

  # GET /kp_comments or /kp_comments.json
  def index
    @kp_post = KpPost.find(params[:kp_post_id])
    @kp_comments = KpComment.all
  end

  # GET /kp_comments/1 or /kp_comments/1.json
  def show
    @kp_post = KpPost.find(params[:kp_post_id])
    @kp_comment = @kp_post.kp_comments.find(params[:id])
  end

  # GET /kp_comments/new
  def new
    @kp_post = KpPost.find(params[:kp_post_id])
    @kp_comment = KpComment.new
  end

  # GET /kp_comments/1/edit
  def edit
  end

  # POST /kp_comments or /kp_comments.json
  def create
    @kp_comment = KpComment.new(kp_comment_params)
    @kp_post = KpPost.find(params[:kp_comment][:kp_post_id])
    @kp_comment.kp_user = current_kp_user

    respond_to do |format|
      if @kp_comment.save
        format.html { redirect_to kp_comment_url(@kp_comment), notice: "Kp comment was successfully created." }
        format.json { render :show, status: :created, location: @kp_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kp_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kp_comments/1 or /kp_comments/1.json
  def update
    respond_to do |format|
      if @kp_comment.update(kp_comment_params)
        format.html { redirect_to kp_comment_url(@kp_comment), notice: "Kp comment was successfully updated." }
        format.json { render :show, status: :ok, location: @kp_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kp_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kp_comments/1 or /kp_comments/1.json
  def destroy
    @kp_post = KpPost.find(params[:kp_post_id])
    @kp_comment = @kp_post.kp_comments.find(params[:id])
    @kp_comment.destroy

    respond_to do |format|
      format.html { redirect_to kp_comments_url, notice: "Kp comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kp_comment
      @kp_comment = KpComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kp_comment_params
      params.require(:kp_comment).permit(:content, :kp_user_id, :kp_post_id)
    end
end
