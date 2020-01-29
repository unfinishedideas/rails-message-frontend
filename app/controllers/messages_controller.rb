require 'rest-client'
require 'pry'
require 'json'

class MessagesController < ApplicationController

  def show
    response = RestClient.get "http://localhost:3000/groups/#{params[:group_id]}/messages/#{params[:id]}"
    @message = response.body
    @message = JSON.parse(@message)
    response = RestClient.get "http://localhost:3000/users/#{@message.fetch("user_id")}"
    @user = response.body
    @user = JSON.parse(@user)
    # binding.pry
    # json_response(@groups)
    render(:show)
  end

  def destroy
    RestClient.delete "http://localhost:3000/groups/#{params[:group_id]}/messages/#{params[:id]}"
    response = RestClient.get "http://localhost:3000/groups/#{params[:group_id]}/messages"
    @messages = response.body
    @messages = JSON.parse(@messages)
    response = RestClient.get "http://localhost:3000/groups/#{params[:group_id]}"
    @group = response.body
    @group = JSON.parse(@group)
    redirect_to "/groups/#{params[:group_id]}"
  end


end


#
#   def index
#     # if params[:group_id]
#     #   @group = Group.find(params[:group_id])
#     # else if params[:user_id]
#     #   @user = User.find(params[:user_id])
#     # end
#     @group = Group.find(params[:group_id])
#     @messages = @group.messages
#     json_response(@messages)
#   end
#
#   def show
#     @message = Message.find(params[:id])
#     json_response(@message)
#   end
#
#   def create
#     @message = Message.create!(message_params)
#     json_response(@message, :created)
#   end
#
#   def update
#     @message = Message.find(params[:id])
#     if @message.update!(message_params)
#       render status: 200, json: {
#         message: "Message successully updated!"
#       }
#     end
#   end
#
#   def destroy
#     @message = Message.find(params[:id])
#     if @message.destroy!
#       render status: 200, json: {
#         message: "DESTROYED Message successfully."
#       }
#     end
#   end
#
#   private
#   def message_params
#     params.permit(:title, :content, :user_id, :group_id)
#   end
# end
