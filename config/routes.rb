Rails.application.routes.draw do
   resources :twitters, :controller => :contents, :except => [:index, :show], :path => "content"
end
