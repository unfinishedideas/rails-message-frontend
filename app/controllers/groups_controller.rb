require 'rest-client'
require 'pry'
require 'json'

class GroupsController < ApplicationController

  def index
    response = RestClient.get 'http://localhost:3000/groups'
    @groups = response.body
    @groups = JSON.parse(@groups)
    # binding.pry
    # json_response(@groups)
    render(:index)
  end
#
  def show
    # binding.pry
    response = RestClient.get "http://localhost:3000/groups/#{params[:id]}"
    @group = response.body
    @group = JSON.parse(@group)
    response = RestClient.get "http://localhost:3000/groups/#{params[:id]}/messages"
    @messages = response.body
    @messages = JSON.parse(@messages)
    render(:show)
  end
#
#   def create
#     @group = Group.create!(group_params)
#     json_response(@group, :created)
#   end
#
#   def update
#     @group = Group.find(params[:id])
#     if @group.update!(group_params)
#       render status: 200, json: {
#         message: "Updated Group Successfully."
#       }
#     end
#   end
#
  def destroy
    RestClient.delete "http://localhost:3000/groups/#{params[:id]}"
    response = RestClient.get 'http://localhost:3000/groups'
    @groups = response.body
    @groups = JSON.parse(@groups)
    render(:index)
  end

#   private
#   def group_params
#     params.permit(:name)
#   end
#
end
