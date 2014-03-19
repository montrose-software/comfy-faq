class Cms::Faq::Question < ActiveRecord::Base
  self.table_name = 'cms_faq_questions'

  belongs_to :category

  validates :title, :answer, presence: true
end
