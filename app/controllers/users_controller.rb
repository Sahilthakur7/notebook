class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def diary
        @user = User.find(params[:id])
        @today = Date.today
    end

end
