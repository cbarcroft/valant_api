Rails.application.routes.draw do

  resources :inventory_items, :path => 'inventory', :except => [:new, :edit, :destroy], defaults: {format: :json} do
    put :remove, :on => :collection
  end

end
