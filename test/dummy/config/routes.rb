Rails.application.routes.draw do

  mount C2Twitter::Engine => "/c2_twitter"
end
