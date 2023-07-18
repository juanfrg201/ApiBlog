class Api::V1::User::Blogs::UserBlogsController < ApplicationController

  # GET /api/v1/:user_id/blogs
  def index
    @api_v1_blogs = Api::V1::Blog.where(user_id: api_user_blogs_params[:user_id])
    render json: @api_v1_blogs
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def api_user_blogs_params
      params.permit(:user_id)
    end
end
