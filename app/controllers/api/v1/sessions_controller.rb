module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

			def create 
				user = User.where(email: params[:email]).first
				if user.valid_password?(params[:password])
					render json: user.as_jason(only: [:id, :email]), status: :created
			end

      private

      def respond_with(resource, _opts = {})
        render json: resource
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end