class PagesController < ApplicationController
  def home
    Rails.logger.debug params[:token]
    @bugs = Bug.all
    if params[:search]
      @bugs = Bug.search(params[:search])
    else
      @bugs = Bug.all
    end
  end

  def callback
    redirect_to root_path
  end

  def link_to_trello
    url = ERB::Util.url_encode(ENV['URL'])
    redirect_to 'https://trello.com/1/authorize' \
                              "?callback_method=fragment&return_url=#{url}&" \
                              "expiration=never&scope=read%2Cwrite" \
                              "&name=BugManager&key=#{ENV['APPKEY']}"
  end
end
