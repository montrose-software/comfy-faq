class Cms::Faq < ActiveRecord::Base
  self.table_name = 'cms_faqs'

  belongs_to :site, class_name: 'Cms::Site'

  has_many :categories,
    class_name: 'Cms::Faq::Category',
    dependent: :destroy
  has_many :questions,
    class_name: 'Cms::Faq::Question',
    through: :categories

  validates :site, :label, :identifier, :path, presence: true
  validates_associated :site
  validates :identifier,
    format: { with: /\A\w[a-z0-9_-]*\z/i }
  validates :path,
    uniqueness: { scope: :site_id },
    format: { with: /\A\w[a-z0-9_-]*\z/i },
    if: :_restricted_path?

  protected

  def _restricted_path?
    (self.class.count > 1 && self.persisted?) ||
    (self.class.count >= 1 && self.new_record?)
  end
end
