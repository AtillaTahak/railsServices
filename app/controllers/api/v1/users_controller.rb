# frozen_string_literal: true

module Api
  module V1
    # Controller for users
    class UsersController < ApplicationController
      # GET /users
      def index
        service = UsersServices::GetPage.new(user_params[:id]).call
        render json: service
      end

      # GET /users/find_user/:email
      def find_user
        service = UsersServices::FindBy.new(user_params[:email]).call

        render json: service
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def user_params
        params.permit(:id, :email)
      end
    end
  end
end
