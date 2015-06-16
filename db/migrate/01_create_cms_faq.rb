class CreateFaq < ActiveRecord::Migration
  def self.up
    create_table :comfy_faqs do |t|
      t.integer :site_id,    null: false
      t.string  :label,      null: false
      t.string  :identifier, null: false
      t.string  :app_layout, null: false, default: 'application'
      t.string  :path
      t.text    :description
    end
    add_index :comfy_faqs, [:site_id, :path]
    add_index :comfy_faqs, :identifier

    create_table :comfy_faq_categories do |t|
      t.integer :faq_id,       null: false
      t.string  :title,        null: false
      t.boolean :is_published, null: false, default: true
      t.integer :position,     null: false, default: 0
      t.timestamps
    end
    add_index :comfy_faq_categories, :faq_id
    add_index :comfy_faq_categories, :is_published
    add_index :comfy_faq_categories, :position

    create_table :comfy_faq_questions do |t|
      t.integer :category_id,  null: false
      t.string  :title,        null: false
      t.text    :answer,       null: false
      t.boolean :is_published, null: false, default: false
      t.integer :position,     null: false, default: 0
      t.timestamps
    end
    add_index :comfy_faq_questions, :category_id
    add_index :comfy_faq_questions, :is_published
    add_index :comfy_faq_questions, :position
  end

  def self.down
    drop_table :comfy_faqs
    drop_table :comfy_faq_categories
    drop_table :comfy_faq_questions
  end
end
