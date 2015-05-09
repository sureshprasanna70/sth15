class RaterController < ApplicationController

  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]
      render :json => true
    else
      render :json => false
    end
  end
  def rated_or_not
    items=Rate.where(:rateable_id=>params[:forum_id]).first
    if not items.start.nil?
      return true
    else
      return false
    end 
  end
end
