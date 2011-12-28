match 'products/:id', :to => 'products#show'
match 'products/:id' => 'products#show'

match "/projects/status"
#As you might be able to deduce, the examples above will route any type of HTTP request to the
#projects controller status action.

get "/projects/status"
post "/reports/publish"

link_to "Products",
	:controller => "products",
	:action => "show",
	:id => 1

match ':controller(/:action(/:id(.:format)))'

match 'products/:id' => 'products#show', :via => :get

get 'products/:id' => 'products#show'
post 'products' => 'products#create'

match "/foo", :to => redirect("/bar")
match "/google", :to => redirect("http://google.com/")

match "/api/v1/:api", :to =>
redirect {|params| "/api/v2/#{params[:api].pluralize}" }

match "/api/v1/:api", :to =>
redirect(:status => 302) {|params| "/api/v2/#{params[:api].pluralize}" }

match ':controller/show/:id' => :show, :constraints => {:id => /\d+/}
match ':controller/show/:id' => :show_error

match 'items/list/*specs', :controller => 'items', :action => 'list'

match 'help' => 'help#index', :as => 'help'

scope :controller => :auctions do
	match 'auctions/new' => :new
	match 'auctions/edit/:id' => :edit
	match 'auctions/pause/:id' => :pause
end

scope :path => '/auctions', :controller => :auctions do
	match 'new' => :new
	match 'edit/:id' => :edit
	match 'pause/:id' => :pause
end

resources :clients, :except => [:index]
resources :clients, :only => [:new, :create]

rake routes
