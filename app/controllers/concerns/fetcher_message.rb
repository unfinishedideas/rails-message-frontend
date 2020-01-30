module FetcherMessage
  def get_groups
    response = RestClient.get 'http://localhost:3000/groups'
    @groups = response.body
    @groups = JSON.parse(@groups)
  end

  def get_messages
    response = RestClient.get "http://localhost:3000/groups/#{params[:group_id]}/messages"
    @messages = response.body
    @messages = JSON.parse(@messages)
  end

  def get_users
    response = RestClient.get 'http://localhost:3000/users'
    @users = response.body
    @users = JSON.parse(@users)
  end

  def get_single_group
    response = RestClient.get "http://localhost:3000/groups/#{params[:group_id]}"
    @group = response.body
    @group = JSON.parse(@group)
  end

  def get_single_message
    response = RestClient.get "http://localhost:3000/groups/#{params[:group_id]}/messages/#{params[:id]}"
    @message = response.body
    @message = JSON.parse(@message)
  end

  def get_single_user
    response = RestClient.get "http://localhost:3000/users/#{@message.fetch("user_id")}"
    @user = response.body
    @user = JSON.parse(@user)
  end



end
