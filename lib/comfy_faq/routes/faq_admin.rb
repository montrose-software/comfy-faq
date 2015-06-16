class ActionDispatch::Routing::Mapper
  def comfy_route_faq_admin(options = {})
    options[:path] ||= 'admin'
    path = [options[:path], 'sites', ':site_id'].join('/')

    scope :module => :comfy, :as => :comfy do
      scope module: :admin do
        namespace :faq, as: :admin, path: path, except: [:show]  do
          resources :faqs do
            resources :categories do
              member do
                put :move_lower
                put :move_higher
              end
              resources :questions, except: [:show] do
                member do
                  put :move_lower
                  put :move_higher
                end
              end
            end
          end
        end
      end
    end
  end
end
