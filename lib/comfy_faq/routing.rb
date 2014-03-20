module ComfyFaq::Routing
  def self.admin(options = {})
    options[:path] ||= 'admin'
    path = [options[:path], 'sites', ':site_id'].join('/')

    Rails.application.routes.draw do
      scope module: :admin do
        namespace :cms, as: :admin_cms, path: path, except: [:show] do
          scope module: :faq do
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

  def self.content(options = {})
    options[:path] ||= 'faq'
    path = options[:path]

    Rails.application.routes.draw do
      namespace :faq, path: path do
        resources :faqs, only: [:show]
      end
    end
  end
end
