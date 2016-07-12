class TweetsController < ApplicationController
  before_action :set_tweets, only: [:edit, :update, :destroy]
  
  def index
    @tweet = Tweet.all
  end
  
  
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end
  
  
  
  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
    redirect_to tweets_path, notice: "ツイートを作成しました！"
    else
      render action: 'new'
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
     @tweet = Tweet.find(params[:id])
     if @tweet.update(tweet_params)
     redirect_to tweets_path, notice: "ツイートを編集しました！"
   else
     render action: 'edit'
     end
  end
     
  def destroy
     @tweet = Tweet.find(params[:id])
     @tweet.destroy
     redirect_to tweets_path, notice: "ツイートを削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end
  
 private
    def tweet_params
      params.require(:tweet).permit(:content)
    end
      
    def set_tweets
      @tweet = Tweet.find(params[:id])
    end
end
