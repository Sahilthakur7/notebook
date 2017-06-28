class DiariesController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        @today = Date.today
        @note = Note.diary_notes.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).first || NullNote.new
        @notes = Note.diary_notes || NullNote.new
        @notes_no = @notes.count
    end

    def new

    end
end
