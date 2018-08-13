Rails.application.routes.draw do
	
  resource :eventracker, only: [:edit, :update]

  resolve("Eventracker") { [:eventacker] }

end