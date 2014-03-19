class Cms::Faq::Category < ActiveRecord::Base
  self.table_name = 'cms_faq_categories'

  belongs_to :faq

  has_many :questions

  validates :title, :faq, presence: true

  scope :published, -> { where(is_published: true) }

  before_create :_before_create_set_is_published

  private

  def _before_create_set_is_published
    # self.is_published = ComfyFaq.config.auto_publish_categories
    self.is_published = true
    true
  end
end
