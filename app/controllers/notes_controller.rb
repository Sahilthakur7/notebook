class NotesController < ApplicationController

    def new
        @note = Note.new
        @user = User.find(params[:user_id])
    end

    def show
        @note = Note.find(params[:id])
        @user = @note.user
        unless on_publish_notes_page
            if current_user != @note.user 
                redirect_to root_path
                flash[:notice] = "You are not allowed to do that"
            end
        end
        @comment = Comment.new
    end

    def index
        @user = User.find(params[:user_id])
        if on_quick_notes_page
            @notes = Note.quick_notes.where(user: @user)
        elsif on_diary_page
            @notes = Note.diary_notes.where(user: @user)
        elsif on_publish_notes_page
            @notes = Note.publish_notes.where(user: @user)
        end
    end

    def create
        @note = current_user.notes.build(note_params) 
        proper_redirection

    end

    def edit
        @note = Note.find(params[:id])
        respond_to do |format|
            format.html
        end
    end

    def update
        @note = Note.find(params[:id])
        if @note.update_attributes(note_params)
            redirect_to user_quick_notes_note_path(current_user,@note)
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.delete
        proper_redirection_delete

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

    def on_publish_notes_page
        if request.original_fullpath.include?("publish")
            return true
        else
            return false
        end
    end

    def proper_redirection
        if on_quick_notes_page
            @note.make_it_quick_note
            if @note.save
                redirect_to user_quick_notes_path(current_user)
            else
                redirect_to root_path
            end

        elsif on_diary_page
            @note.make_it_diary_note
            if @note.save

                redirect_to user_diary_path(current_user)
            else
                redirect_to root_path
            end
        elsif on_publish_notes_page
            @note.make_it_publish_note
            if @note.save
                redirect_to user_publish_notes_path(current_user)
            else
                redirect_to root_path
            end

        else

            redirect_to root_path
            flash[:alert] = "Couldn't save your note"
        end
    end

    def proper_redirection_delete
        if on_quick_notes_page
            redirect_to user_quick_notes_path(current_user)

        elsif on_diary_page

            redirect_to user_diary_path(current_user)
        end


    end
end
