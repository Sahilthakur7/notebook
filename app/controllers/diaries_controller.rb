class DiariesController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        @today = Date.today
    end

    def new

    end
end
