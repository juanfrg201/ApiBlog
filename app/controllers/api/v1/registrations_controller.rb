module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json # Agrega esta línea para indicar que el controlador responderá con JSON

      def create
        build_resource(sign_up_params)

        if resource.save
          sign_up(resource_name, resource)
          render json: { message: 'Usuario creado exitosamente', user: resource }, status: :created
        else
          render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def sign_up_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end