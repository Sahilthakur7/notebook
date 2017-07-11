module ApplicationHelper
    def resource_name
        :user
    end

    def resource
        @resource || User.new
    end

    def devise_mapping
        @devise_mapping || Devise.mappings[:user]
    end

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

    def receiver_user(receiver)
            User.find(receiver)
    end
end
