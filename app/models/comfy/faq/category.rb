class Comfy::Faq::Category < ActiveRecord::Base
  self.table_name = 'comfy_faq_categories'

  belongs_to :faq
  acts_as_list scope: :faq

  has_many :questions, -> { order('position ASC') },
    dependent: :destroy

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
