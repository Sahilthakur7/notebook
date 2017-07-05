class CommentsController < ApplicationController
    def create
        @note = Note.find(params[:note_id])
        @user = User.find(params[:user_id])
        @comment = @note.comments.build(comment_params)
        @comment.set_user(current_user)
        if @comment.save!
            redirect_to user_publish_notes_note_path(@user,@note)
        else
            redirect_to root_path
            flash[:notice] = "Sorry your comment couldn't be registered."
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
