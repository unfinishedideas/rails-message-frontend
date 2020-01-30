require 'rest-client'
require 'pry'
require 'json'

class MessagesController < ApplicationController
include FetcherMessage

  def show
    get_single_group
    get_single_message
    get_single_user
    render(:show)
  end

  def destroy
    RestClient.delete "http://localhost:3000/groups/#{params[:group_id]}/messages/#{params[:id]}"
    get_messages
    get_single_group
    redirect_to "/groups/#{params[:group_id]}"
  end

  def new
    get_single_group
    get_users
    render(:new)
  end

  def edit
    get_single_message
    get_single_user
    get_single_group
    get_users
    render(:edit)
  end

  def update
    RestClient.patch "http://localhost:3000/groups/#{params[:group_id]}/messages/#{params[:id]}", {title: "#{params[:title]}", content: "#{params[:content]}", user_id: "#{params[:user_id]}"}
    redirect_to "/groups/#{params[:group_id]}/messages/#{params[:id]}"
  end

  def create
    RestClient.post "http://localhost:3000/groups/#{params[:group_id]}/messages", {title: "#{params[:title]}", content: "#{params[:content]}", user_id: "#{params[:user_id]}"}
    redirect_to "/groups/#{params[:group_id]}"
  end

  private
  def group_params
    params.permit(:title, :content, :user_id, :group_id)
  end

end
