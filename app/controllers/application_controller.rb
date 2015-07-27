class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
protect_from_forgery with: :null_session                 # modification
  def authenticate_mentor_user!
    authenticate_user!
    fail SecurityError if current_user.admin == false
  end

  rescue_from SecurityError do |_exception|
    redirect_to '/admin/logout'
  end

  def render_response body, code=200
    body = {
      code: code,
      body: body
    }

    render json: body, status: code
  end

end
