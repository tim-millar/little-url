Rails.application.routes.draw do

  get 'new/*long_url', to: 'url#new', :constraints => { :long_url => /.*/ }

  get '/:short_url', to: 'redirect#index'

end
