class ActionDispatch::Routing::Mapper
  def comfy_route_faq(options = {})
    options[:path] ||= 'faq'
    path = options[:path]

    scope :module => :comfy, :as => :comfy do
      namespace :faq, path: path do
        resources :faqs, only: [:show]
      end
    end
  end
end
