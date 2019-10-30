require 'pry'
class TweetsController < ApplicationController

    get '/tweets' do 
        @tweets = Tweet.all 
      if logged_in?
        erb:'tweets/index' 
      else 
        redirect to "/login"
      end 
    end

    get '/tweets/new' do 
      if logged_in?
         erb:'/tweets/new'
      else 
        redirect to "/login"
      end 
    end 

    post '/tweets' do 
        if params[:content] != ""
            @tweet = Tweet.create(content: params[:content])
            current_user.tweets << @tweet
        else 
            redirect to "/tweets/new"
        end 
    end 

    get '/tweets/:id' do 
      @user = User.find_by(username: params["id"])
      if logged_in?
        erb:"tweets/show"
      end
    end 

    

end
