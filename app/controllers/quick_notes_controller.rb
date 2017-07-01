class QuickNotesController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @note = Note.new
    end

    def show
        @user = User.find(params[:user_id])
        unless is_owner?(current_user)
            flash[:notice] = "You are not allowed that!"
            redirect_to root_path
        end

    end

    def index
    end
end
