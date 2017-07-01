class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    def is_owner?(user)

        if owner == user
            return true
        else
            return false
        end
    end

    def owner
        @owner = User.find(params[:user_id] || params[:id])
    end
end
