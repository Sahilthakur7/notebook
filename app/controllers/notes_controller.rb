class NotesController < ApplicationController

    def new
        @note = Note.new
        @user = User.find(params[:user_id])
    end

    def show

    end

    def create
        @note = current_user.notes.build(note_params) 
        if on_quick_notes_page
            if @note.save
                redirect_to user_quick_notes_path(current_user)
            else
                redirect_to root_path
            end

        elsif on_diary_page
            if @note.save

                redirect_to user_diary_path(current_user)
            else
                redirect_to root_path
            end
        else
            redirect_to root_path
        end
    end

    private

    def note_params
        params.require(:note).permit(:title,:content,:visibility)
    end

    def on_diary_page
        if request.original_fullpath.include?("diary")
            return true
        else
            return false
        end
    end

    def on_quick_notes_page
        if request.original_fullpath.include?("quick")
            return true
        else
            return false
        end
    end
end
