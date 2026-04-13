class Comment < ApplicationRecord
  belongs_to :recipe

  validates :content, presence: true
  validates :author_name, presence: true

  after_initialize :set_default_author, if: :new_record?

  private

  def set_default_author
    self.author_name = 'Anônimo' if author_name.blank?
  end
end
