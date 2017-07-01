class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def index
        if params[:search]
            @users = User.search(params[:search])
        else
            @users = User.all
        end
    end

    def diary
        @user = User.find(params[:id])
        @today = Date.today
    end

end
