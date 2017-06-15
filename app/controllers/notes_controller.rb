class NotesController < ApplicationController
    def new
        @note = Note.new
    end

    def show

    end

    def create
        @note = current_user.notes.create(note_params) 
        if @note.save
            redirect to diary_user_path(current_user)
        end
    end

    private

    def note_params
        params.require(:note).permit(:title,:content,:visibility)
    end
end

