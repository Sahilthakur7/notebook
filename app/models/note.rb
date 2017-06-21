class Note < ActiveRecord::Base
  belongs_to :user

  def make_it_quick_note
      update_attribute(:visibility, "quick")
  end

  def make_it_diary_note
      update_attribute(:visibility, "diary")
  end
end
