class Note < ActiveRecord::Base
  belongs_to :user
  scope :quick_notes, -> { where(visibility: 'quick')}
  scope :diary_notes, -> { where(visibility: 'diary')}
  scope :publish_notes, -> { where(visibility: 'publish')}
  scope :sent_notes, -> { where(visibility: 'shared')}
  scope :received_notes, -> { where(visibility: 'shared')}
  default_scope -> { order(created_at: :desc)}
  has_many :comments


  def make_it_quick_note
      update_attribute(:visibility, "quick")
  end

  def make_it_diary_note
      update_attribute(:visibility, "diary")
  end

  def make_it_publish_note
      update_attribute(:visibility, "publish")
  end

  def make_it_shared_note
      update_attribute(:visibility, "shared")
  end

  def creation_date
      created_at.to_date
  end

  def author
      user.to_s
  end

end
