class ForumsController < ApplicationController
  before_action :set_forum,only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  respond_to :html
  def selffeed
    @forums = current_user.forums
    respond_with(@forums)
  end
  def index
    @mapping=current_user.mapping.pluck(:forum_id)
    @forums = current_user.forums.where(:id=>@mapping)
    respond_with(@forums)
  end

  def show
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
    HardWorker.perform_async(@forum.id, user_count)
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
