class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html,:js

  def index
    @feedbacks = Feedback.all
    respond_with(@feedbacks)
  end

  def show
    respond_with(@feedback)
  end

  def new
    @feedback = Feedback.new
    if check_comment(params[:forum_id])==true
       session[:forum_id]=params[:forum_id]
       respond_with(@feedback)
    end
  end
  def check_comment(forum_id)
    comments=Feedback.where(:forum_id=>forum_id).pluck(:user_id)
    comm=comments.to_a
    if comm.include?current_user.id
      flash[:alert]="Already commented"
      redirect_to root_path
    else
      return true
    end
  end
  def edit
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.forum_id=session[:forum_id]
    @feedback.user_id=current_user.id
    flash[:notice] = 'Feedback was successfully created.' if @feedback.save
    redirect_to root_path
  end

  def update
    flash[:notice] = 'Feedback was successfully updated.' if @feedback.update(feedback_params)
    respond_with(@feedback)
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback)
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:comment, :user_id)
    end
end
