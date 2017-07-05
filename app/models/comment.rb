class Comment < ActiveRecord::Base
    belongs_to :note
    belongs_to :user
    default_scope -> { order(created_at: :desc)}


    def set_user(current_user)
        update_attribute(:user_id, current_user.id)
    end
end
