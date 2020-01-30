require 'rest-client'
require 'pry'
require 'json'

class GroupsController < ApplicationController
  include Fetcher


  # controllers --------------------------------------------------------------

  def index
    get_groups
    render(:index)
  end

  def show
    get_single_group
    get_messages
    render(:show)
  end

  def create
    RestClient.post('http://localhost:3000/groups', {name: "#{params[:name]}"})
    redirect_to "/groups"
  end

  def new
    render (:new)
  end

  def edit
    get_single_group
    render(:edit)
  end

  def update
    RestClient.patch "http://localhost:3000/groups/#{params[:id]}", {name: "#{params[:name]}"}
    get_single_group
    render(:edit)
  end

  def destroy
    RestClient.delete "http://localhost:3000/groups/#{params[:id]}"
    get_groups
    render(:index)
  end

  # private
  # def group_params
  #   params.permit(:name)
  # end

end
