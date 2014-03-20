require 'rubygems'
require 'rails'
require 'comfortable_mexican_sofa'
require 'comfy_faq'

module ComfyFaq
  module CmsSiteExtensions
    extend ActiveSupport::Concern
    included do
      has_many :faqs,
        class_name: 'Cms::Faq',
        dependent: :destroy
    end
  end

  class Engine < ::Rails::Engine
    initializer 'comfy_faq.configuration' do |app|
      ComfortableMexicanSofa::ViewHooks.add(:navigation, '/admin/cms/faq/partials/navigation')
      config.to_prepare do
        Cms::Site.send :include, ComfyFaq::CmsSiteExtensions
      end
    end
  end
end
