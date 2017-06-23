class Note < ActiveRecord::Base
  belongs_to :user
  scope :quick_notes, -> { where(visibility: 'quick')}
  scope :diary_notes, -> { where(visibility: 'diary')}
  default_scope -> { order(created_at: :desc)}


  def make_it_quick_note
      update_attribute(:visibility, "quick")
  end

  def make_it_diary_note
      update_attribute(:visibility, "diary")
  end

  def creation_date
      created_at.to_date
  end

  def author
      user.to_s
  end

end
