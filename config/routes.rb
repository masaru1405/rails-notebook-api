Rails.application.routes.draw do
  
  resources :kinds
  resources :auths, only: [:create]

  ### Segmento de URL usando a gem versionist ###
  ### Liberar no arquivo development.rb (config/enviroments) ###
  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
  
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'
  
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
  
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end

  ###########################################################################################

  ### Usando subdominio => criar no arquivo hosts do SO e liberar no arquivo development.rb (config/enviroments) ###
  # constraints subdomain: 'v1' do
  #   scope module: 'v1' do
  #     resources :contacts do
  #       resource :kind, only: [:show]
  #       resource :kind, only: [:show], path: 'relationships/kind'
    
  #       resource :phones, only: [:show]
  #       resource :phones, only: [:show], path: 'relationships/phones'
  #       resource :phone, only: [:update, :create, :destroy]
  #       resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
    
  #       resource :address, only: [:show, :update, :create, :destroy]
  #       resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  #     end
  #   end
  # end

  # constraints subdomain: 'v2' do
  #   scope module: 'v2' do
  #     resources :contacts do
  #       resource :kind, only: [:show]
  #       resource :kind, only: [:show], path: 'relationships/kind'
    
  #       resource :phones, only: [:show]
  #       resource :phones, only: [:show], path: 'relationships/phones'
  #       resource :phone, only: [:update, :create, :destroy]
  #       resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
    
  #       resource :address, only: [:show, :update, :create, :destroy]
  #       resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  #     end
  #   end
  # end

  ##############################################################################################

  ### Params para especificar a versão ###
  # scope module: 'v1' do
  #   resources :contacts, :constraints => lambda {|request| request.params[:version] == '1'} do
  #     resource :kind, only: [:show]
  #     resource :kind, only: [:show], path: 'relationships/kind'
  
  #     resource :phones, only: [:show]
  #     resource :phones, only: [:show], path: 'relationships/phones'
  #     resource :phone, only: [:update, :create, :destroy]
  #     resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
  
  #     resource :address, only: [:show, :update, :create, :destroy]
  #     resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  #   end
  # end

  

  # scope module: 'v2', :constraints => lambda {|request| request.params[:version] == '2'} do
  #   resources :contacts do
  #     resource :kind, only: [:show]
  #     resource :kind, only: [:show], path: 'relationships/kind'
  
  #     resource :phones, only: [:show]
  #     resource :phones, only: [:show], path: 'relationships/phones'
  #     resource :phone, only: [:update, :create, :destroy]
  #     resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'
  
  #     resource :address, only: [:show, :update, :create, :destroy]
  #     resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  #   end
  # end

end
