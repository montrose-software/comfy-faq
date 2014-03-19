class CreateFaq < ActiveRecord::Migration
  def self.up
    create_table :cms_faqs do |t|
      t.integer :site_id,    null: false
      t.string  :label,      null: false
      t.string  :identifier, null: false
      t.string  :app_layout, null: false, default: 'application'
      t.string  :path
      t.text    :description
    end
    add_index :cms_faqs, [:site_id, :path]
    add_index :cms_faqs, :identifier

    create_table :cms_faq_categories do |t|
      t.integer   :faq_id,       null: false
      t.string    :title,        null: false
      t.boolean   :is_published, null: false, default: true
      t.datetime  :published_at, null: false
      t.timestamps
    end
    add_index :cms_faq_categories, :faq_id
    add_index :cms_faq_categories, :is_published

    create_table :cms_faq_questions do |t|
      t.integer :category_id, null: false
      t.string  :author,              null: false
      t.string  :email,               null: false
      t.text    :content
      t.boolean :is_published,        null: false, default: false
      t.timestamps
    end
    add_index :cms_faq_questions, :category_id
    add_index :cms_faq_questions, :is_published
  end

  def self.down
    drop_table :cms_faqs
    drop_table :cms_faq_categories
    drop_table :cms_faq_questions
  end
end
