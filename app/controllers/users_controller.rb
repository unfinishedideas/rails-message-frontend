# class UsersController < ApplicationController
#
#   def index
#     @users = User.all
#     json_response(@users)
#   end
#
#   def show
#     @user = User.find(params[:id])
#     json_response(@user)
#   end
#
#   def create
#     @user = User.create!(user_params)
#     json_response(@user, :created)
#   end
#
#   def update
#     @user = User.find(params[:id])
#     if @user.update!(user_params)
#       render status: 200, json: {
#         message: "Updated User successfully!"
#       }
#     end
#   end
#
#   def destroy
#     @user = User.find(params[:id])
#     if @user.destroy!
#       render status: 200, json: {
#         message: "DESTROYED User successfully."
#       }
#     end
#   end
#
#   private
#   def user_params
#     params.permit(:user_name)
#   end
# end
