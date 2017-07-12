class SharedNotesController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        @note = Note.new
        @sent_notes = Note.sent_notes.where(user: @user)
        @received_notes = Note.received_notes.where(receiver: @user.id)
        unless request.original_fullpath.include?((current_user.id).to_s)
            redirect_to root_path
            flash[:notice] = "You are not allowed to do that"
        end
        
    end
end
