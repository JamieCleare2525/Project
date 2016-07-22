class BugsController < ApplicationController
  def new
    @bug = Bug.new
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def index
    redirect_to new_bug_path
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.user = current_user

    if @bug.save
      card_to_trello(@bug)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    redirect_to root_path
  end



  private

  def bug_params
    params.require(:bug).permit(
      :title,
      :expected_outcome,
      :actual_outcome,
      :solution_attempt,
      :status,
      :url,
      :other_info,
      :picture,
      :file
    )
  end

  def get_trello_user_boards
    Rails.logger.debug (("*" * 10) + ENV['APPKEY'] + " #{current_user.trello_token}")
    response = RestClient.get "https://api.trello.com/1/members/jamiecleare/boards?key=#{ENV['APPKEY']}&token=#{current_user.trello_token}"
    data = JSON.parse(response)
    Rails.logger.debug response
    #ßRails.logger.debug(data.second)
    board = data.second
  end

  def get_trello_board_list(board)
    response = RestClient.get "https://api.trello.com/1/boards/#{board['id']}/lists?key=#{ENV['APPKEY']}&token=#{current_user.trello_token}"
    Rails.logger.debug(response)
    data = JSON.parse(response)
  end

  def card_to_trello(bug)
    board = get_trello_user_boards
    list = get_trello_board_list(board)
    description = "Expected Outcome: \n #{bug.expected_outcome} \n" \
      "Actual Outcome: \n #{bug.actual_outcome} \n Reported By: \n" \
      "#{User.find(bug.user_id).name}"
    RestClient.post "https://api.trello.com/1/cards?key=#{ENV['APPKEY']}&" \
      "token=#{current_user.trello_token}",
      {'name' => bug.title,
       "desc" => description,
       "idList" => list.first["id"],
       "due" => "null"}
  end
end
