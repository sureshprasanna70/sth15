class RaterController < ApplicationController

  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]
      if params[:score] >= 3
        HardWorker.perform_async(2,obj.id,User.count,current_user.id)
      end
      render :json => true
    else
      render :json => false
    end
  end
end
