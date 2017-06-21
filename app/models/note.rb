class Note < ActiveRecord::Base
  belongs_to :user
  scope :quick_notes, -> { where(visibility: 'quick')}
  scope :diary_notes, -> { where(visibility: 'diary')}


  def make_it_quick_note
      update_attribute(:visibility, "quick")
  end

  def make_it_diary_note
      update_attribute(:visibility, "diary")
  end


end
