class Api::PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    # @posts = Post.all
    # render json: @posts
    posts = Post.all.map{|post| post.tags}
    render json: posts.include?("tragedy")
    #{ error: "Tags parameter is required"}, status: 404
  end

  # GET /posts/1
  # def show
  #   @post = Post.where(tags: "history")
  #   render json: @post
  # end

  # # POST /posts
  # def create
  #   @post = Post.new(post_params)

  #   if @post.save
  #     render json: @post, status: :created, location: @post
  #   else
  #     render json: @post.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /posts/1
  # def update
  #   if @post.update(post_params)
  #     render json: @post
  #   else
  #     render json: @post.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /posts/1
  # def destroy
  #   @post.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   @post = Post.where(tags: "history")
    #   # @post = Post.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    # def post_params
    #   params.require(:post).permit(:author, :authorId, :likes, :popularity, :reads, :tags)
    # end
end
