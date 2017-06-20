class QuickNotesController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @note = Note.new
    end

    def show

    end

    def index
    end
end
