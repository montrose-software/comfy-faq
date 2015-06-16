require 'rubygems'
require 'rails'
require 'comfortable_mexican_sofa'
require 'comfy_faq'

module ComfyFaq
  module CmsSiteExtensions
    extend ActiveSupport::Concern
    included do
      has_many :faqs,
        class_name: '::Comfy::Faq::Faq',
        dependent: :destroy
    end
  end

  class Engine < ::Rails::Engine
    initializer 'comfy_faq.configuration' do |app|
      ComfortableMexicanSofa::ViewHooks.add(:navigation, '/comfy/admin/faq/partials/navigation')
      config.to_prepare do
        Comfy::Cms::Site.send :include, ComfyFaq::CmsSiteExtensions
      end
    end
  end
end
