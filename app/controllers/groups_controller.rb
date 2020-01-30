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
  def create
    binding.pry
    RestClient.post('http://localhost:3000/groups', {name: "#{group_params.name}"})
    # RestClient.post 'http://localhost:3000/groups', {name: "#{group_params.name}"}
    redirect_to "/groups"
  end

  def new
    # response = RestClient.get "http://localhost:3000/groups/#{params[:id]}"
    # @group = response.body
    # @group = JSON.parse(@group)
    render (:new)
  end

  def edit
    response = RestClient.get "http://localhost:3000/groups/#{params[:id]}"
    @group = response.body
    @group = JSON.parse(@group)
    render(:edit)
  end

  def update
    RestClient.patch "http://localhost:3000/groups/#{params[:id]}", {name: "#{:name}"}
    response = RestClient.get "http://localhost:3000/groups/#{params[:id]}"
    @group = response.body
    @group = JSON.parse(@group)
    render(:edit)
  end

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
private
def group_params
  params.permit(:name)
end

end
