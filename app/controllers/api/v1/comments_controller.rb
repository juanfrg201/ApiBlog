class Api::V1::CommentsController < ApplicationController


  def create
    @user = User.find_by(id: create_params[:user_id]) 
    if @user.present?
      @api_v1_comment = Api::V1::Comment.new(body: create_params[:body], api_v1_blog_id: create_params[:blog_id].to_i , user_id: @user.id)
      if @api_v1_comment.save
        render json: @api_v1_comment, status: :created
      else
        render json: @api_v1_comment.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    @blog = Api::V1::Blog.find_by(id: params[:blog_id])
    if @blog.present?
      @comments = Api::V1::Comment.where(api_v1_blog_id: @blog.id)
      render json: @comments
    end
  end

  private

  def create_params 
    params.require(:comment).permit(:body, :user_id, :blog_id)
  end

end
