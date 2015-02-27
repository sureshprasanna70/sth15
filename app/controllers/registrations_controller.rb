class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:email,:password,:password_confirmation,:name,:college,:department,:year,:phone)
  end
  def account_update_params 
    params.require(:user).permit(:email,:password,:password_confirmation,:name,:college,:department,:year,:phone)
  end
end
