class Api::V1::CommunitiesController < ApplicationController
  before_action :set_api_v1_community, only: %i[ show update destroy ]

  # GET /api/v1/communities
  def index
    @api_v1_communities = Api::V1::Community.all

    render json: @api_v1_communities
  end

  # GET /api/v1/communities/1
  def show
    render json: @api_v1_community
  end

  # POST /api/v1/communities
  def create
    user = User.find_by(authentication_token: api_v1_community_params[:token])
    if user.present? 
      @api_v1_community = Api::V1::Community.new(name: api_v1_community_params[:name], user_id: user.id)

      if @api_v1_community.save
        render json: @api_v1_community, status: :created, location: @api_v1_community
      else
        render json: @api_v1_community.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /api/v1/communities/1
  def update
    if @api_v1_community.update(api_v1_community_params)
      render json: @api_v1_community
    else
      render json: @api_v1_community.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/communities/1
  def destroy
    @api_v1_community.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_community
      @api_v1_community = Api::V1::Community.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_community_params
      params.permit(:name, :token)
    end
end
