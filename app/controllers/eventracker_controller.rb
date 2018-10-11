class EventrackerController < ApplicationController 

 def edit 
	@config = Eventracker::Config.instance
 end

 def update 
  Eventracker::Config.instance.webhook_url = params[:eventracker_config][:webhook_url]
  redirect_to :home
 end

end