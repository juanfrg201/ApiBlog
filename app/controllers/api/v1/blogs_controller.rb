class Api::V1::BlogsController < ApplicationController
  before_action :set_api_v1_blog, only: %i[ show update destroy ]

  # GET /api/v1/blogs
  def index
    @api_v1_blogs = Api::V1::Blog.all

    render json: @api_v1_blogs
  end

  # GET /api/v1/blogs/1
  def show
    render json: @api_v1_blog
  end

  # POST /api/v1/blogs
  def create
    user = User.find_by(id: api_v1_blog_params[:user_id])
    puts api_v1_blog_params[:user_id]
    if user.present?
      @api_v1_blog = Api::V1::Blog.new(title: api_v1_blog_params[:title], body: api_v1_blog_params[:body], user_id: user.id)
      if @api_v1_blog.save
        render json: @api_v1_blog, status: :created, location: @api_v1_blog
      else
        render json: @api_v1_blog.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /api/v1/blogs/1
  def update
    if @api_v1_blog.update(api_v1_blog_params)
      render json: @api_v1_blog
    else
      render json: @api_v1_blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/blogs/1
  def destroy
    @api_v1_blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_blog
      @api_v1_blog = Api::V1::Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_blog_params
      params.require(:blog).permit(:title, :body, :user_id)
    end
end
