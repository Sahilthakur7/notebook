class SharedNotesController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        @note = Note.new
        @sent_notes = Note.sent_notes.where(user: @user)
        @received_notes = Note.received_notes.where(receiver: @user.id)
    end
end
