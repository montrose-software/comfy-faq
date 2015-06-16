class Comfy::Faq::Question < ActiveRecord::Base
  self.table_name = 'comfy_faq_questions'

  belongs_to :category
  acts_as_list scope: :category

  validates :title, :answer, presence: true

  scope :published, -> { where(is_published: true) }
end
