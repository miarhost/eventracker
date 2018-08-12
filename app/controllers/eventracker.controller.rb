class EventrackerController < ApplicationController 

def config 
@endpoint = STDIN.noecho(&:gets)
url = URI.parse(endpoint)

render 'config_form'
end

end