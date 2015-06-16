class UpgradeFaqToCms1120 < ActiveRecord::Migration
  def self.up
    rename_table :cms_faqs,            :comfy_faqs
    rename_table :cms_faq_categories,  :comfy_faq_categories
    rename_table :cms_faq_questions,   :comfy_faq_questions
  end

  def self.down
    rename_table :comfy_faqs,           :cms_faqs
    rename_table :comfy_faq_categories, :cms_faq_categories
    rename_table :comfy_faq_questions,  :cms_faq_questions
  end
end
