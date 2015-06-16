module ComfyFaq
  class Configuration

    # Categories can be automatically approved/published by changing this setting
    # Default is false.
    attr_accessor :auto_publish_categories

    # Configuration defaults
    def initialize
      @auto_publish_comments  = false
    end

  end
end
