ActionController::Routing::Routes.draw do |map|
  map.resources :spell_train_specs, :belongs_to => :guild
  map.resources :skill_train_specs, :belongs_to => :guild
  map.resources :slot_affects, :has_one => :slot, :belongs_to => :equipment_piece
  map.resources :skill_affects, :has_one => :skill, :belongs_to => :equipment_piece
  map.resources :spell_affects, :has_one => :spell, :belongs_to => :equipment_piece
  map.resources :spells, :belongs_to => :guild
  map.resources :skills, :belongs_to => :guild
  map.resources :resistance_affects, :has_one => :damage_type, :belongs_to => :equipment_piece
  map.resources :stat_affects, :has_one => :stat, :belongs_to => :equipment_piece
  map.resources :equipment_pieces, :belongs_to => :equipment_monster, :has_many => [ :stat_affects, :resistance_affects, :skill_affects, :spell_affects, :slot_affects ]
  map.resources :guilds, :has_one => :guild_type, :has_many => [ :skill_train_specs, :spell_train_specs ]
  map.resources :damage_levels
  map.resources :alignment_levels
  map.resources :armor_class_levels
  map.resources :hunger_levels
  map.resources :stat_levels
  map.resources :guild_types
  map.resources :races
  map.resources :stats
  map.resources :equipment_monsters, :has_many => [ :equipment_pieces ]
  map.resources :damage_types
  map.resources :slots
  
  map.connect 'equipment_pieces/by_name/:name', :controller => 'equipment_pieces', :action => 'show'
  map.connect 'equipment_monsters/by_name/:name', :controller => 'equipment_monsters', :action => 'show'

  map.restore_guild             'guilds/:guild_id/restore/:version_id', :controller => 'guilds', :action => 'restore'
  map.restore_alignment_level   'alignment_levels/:alignment_level_id/restore/:version_id', :controller => 'alignment_levels', :action => 'restore'
  map.restore_race              'races/:race_id/restore/:version_id', :controller => 'races', :action => 'restore'
  map.restore_equipment_monster 'equipment_monsters/:equipment_monster_id/restore/:version_id', :controller => 'equipment_monsters', :action => 'restore'
  map.restore_equipment_piece   'equipment_pieces/:equipment_piece_id/restore/:version_id', :controller => 'equipment_pieces', :action => 'restore'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "pages"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
