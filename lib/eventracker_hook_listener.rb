require 'net/http'
class EventrackerHookListener < Redmine::Hook::Listener

 def eventracker(context={})
  Rails.logger.info "::Eventracker::"

  controller = context[:request][:controller]
  action = context[:request][:action]
  Rails.logger.info "Tracking #{controller}/ #{action}"

  url = URI.parse(Eventracker::Config.instance.webhook_url)
  res = Net::HTTP.post_form(url, 'data' => collect_data(from: context).to_json)
  Rails.logger.info "Sending event data to #{url}..."
  Rails.logger.info res.code 
  Rails.logger.info res.body
 end

private 
 
 def collect_data(from: context)
  data = {}
  data[:issueid] = context[:controller].params[:id]
  data[:userid] = context[:controller].session[:user_id]
  data[:datetime] = Issue.find(context[:controller].params[:id]).updated_at
  data[:report] = report_from(context: context)
  data
 end

 def report_from(context:)
   issue = Issue.find(context[:controller].params[:id])
   body_text = issue.description
   comment_text = comment_text_from(issue)

   report = {
   	scount: {
   		body: character_count(body_text),
   		comments: character_count(comment_text)
   	},
   	wcount: {
   		body: word_count(body_text),
   		comments: word_count(comment_text)
   	},
   	mused:{
   		body: most_used_character(body_text),
   		comments: most_used_character(comment_text)
   	}

   }
 end

 def character_count(string)
  string.split('').size
 end

 def word_count(string)
   string.split(/[\s,.-]/).size
 end

 def most_used_character(string)
   characters = string.split('') - [' ', ',', '.', '-']

  freqs = characters.inject({}) do |freqs, char|
 	freqs.merge({char => characters.count(char)})
  freqs.max_by { |char,times_used| times_used }.first
  end
 end
 
end
