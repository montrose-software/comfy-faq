class Cms::Faq::Question < ActiveRecord::Base
  self.table_name = 'cms_faq_questions'

  belongs_to :category
  acts_as_list scope: :category

  validates :title, :answer, presence: true

  scope :published, -> { where(is_published: true) }
end
