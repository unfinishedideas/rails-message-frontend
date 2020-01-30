require 'rest-client'
require 'pry'
require 'json'
class GroupsController < ApplicationController

  def index
    response = RestClient.get 'http://localhost:3000/groups'
    @groups = response.body
    @groups = JSON.parse(@groups)
    render(:index)
  end
#
  def show
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
    RestClient.post('http://localhost:3000/groups', {name: "#{params[:name]}"})
    redirect_to "/groups"
  end

  def new
    render (:new)
  end

  def edit
    response = RestClient.get "http://localhost:3000/groups/#{params[:id]}"
    @group = response.body
    @group = JSON.parse(@group)
    render(:edit)
  end

  def update
    RestClient.patch "http://localhost:3000/groups/#{params[:id]}", {name: "#{params[:name]}"}
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
