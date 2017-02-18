class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_option
    if current_user.admin == true
      rails_admin_path
    else
      root_path
    end
  end
end
