class ForumsController < ApplicationController
  before_action :set_forum,only: [:show, :edit, :update, :destroy,:showfeed]
  before_filter :sign_in_check
  respond_to :html
  def index
    @forums = current_user.forums
    respond_with(@forums)
  end
  def selffeed
    @mapping=$redis.smembers(current_user.id)
    @forums = Forum.where(:id=>@mapping)
    respond_with(@forums)
  end
  def showfeed
    respond_with(@forum)
  end
  def show
    @rateable=Rate.where(:rateable_id=>@forum_id).first
    if not @rateable.nil?
      if @rateable.stars
        @show_value=true
      end
    else
      @show_value=false
    end

    respond_with(@forum)
  end

  def new
    @forum = Forum.new
    respond_with(@forum)
  end

  def edit
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.user_id=current_user.id
    user_count=User.count
    @forum.save
    puts @forum.id
    HardWorker.perform_async(1,@forum.id, user_count,current_user_id)
    respond_with(@forum)
  end

  def update
    @forum.update(forum_params)
    respond_with(@forum)
  end

  def destroy
    @forum.destroy
    respond_with(@forum)
  end
  def sign_in_check
    if not user_signed_in?
      redirect_to root_path
    end
  end
  private
  def set_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:title, :content, :tags, :user_id)
  end
end
