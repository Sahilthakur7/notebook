class NotesController < ApplicationController
    def new
        @note = Note.new
        @user = User.find(params[:user_id])
    end

    def show

    end

    def create
        @note = current_user.notes.build(note_params) 
        if @note.save
            redirect_to user_diary_path(current_user)
        else
            redirect_to user_diary_note_path
        end
    end

    private

    def note_params
        params.require(:note).permit(:title,:content,:visibility)
    end
end

