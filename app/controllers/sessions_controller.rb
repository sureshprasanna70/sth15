class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  before_filter :ensure_params_exist
  respond_to :json
  skip_before_filter :verify_authenticity_token
  def create
    respond_to do |format|
    # when you log into the application through a web browser you go to the format.html option
    # Thus you're not calling the build_resource method
      format.html {
        super
      }
    # So, lets try to sign in without the build_resource 
    # I am not really sure what you can do, but try this
      format.json { 

        resource = User.find_for_database_authentication(:login=>params[:user_login][:login])
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:user_login][:password])
          sign_in("user", resource)
          render :json=> {:success=>true, :email=>resource.email,:name=>resource.name,:id=>resource.id,:college=>resource.college}
        return
        end
        invalid_login_attempt
        # build_resource  # <-This line is evidently producing an error!
        # user = User.find_for_database_authentication(:email => params[:user][:email])
        # return invalid_login_attempt unless resource
        # return invalid_login_attempt unless user
      }
    end
   end
  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end 

