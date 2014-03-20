require 'acts_as_list'
require_relative 'comfy_faq/version'
require_relative 'comfy_faq/engine'
require_relative 'comfy_faq/configuration'
require_relative 'comfy_faq/routing'

module ComfyFaq
  class << self
    # Modify Faq configuration
    # Example:
    #   ComfyBlog.configure do |config|
    #     config.posts_per_page = 5
    #   end
    def configure
      yield configuration
    end

    # Accessor for ComfyFaq::Configuration
    def configuration
      @configuration ||= ComfyFaq::Configuration.new
    end
    alias_method :config, :configuration
  end
end
