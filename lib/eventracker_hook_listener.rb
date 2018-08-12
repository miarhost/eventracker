require 'net/http'
class EventrackerHookListener < Redmine::Hook::listener

 def eventracker(context={})
  controller = context[:request][:controller]
  action = context[:request][:action]
  Rails.logger.info "Tracking #{controller}/ #{action}"

  url = URI.parse('http://localhost:9292/hello')
  res = Net::HTTP.post_form(url, 'data' => collect_data(from: context).to_json)
 
  Rails.logger.info res.code 
  Rails.logger.info res.body
 end

private 
 
 def collect_data(from: context)
  data = {}
data[:issueid] = context[:controller].params[:id]
  byebug
end