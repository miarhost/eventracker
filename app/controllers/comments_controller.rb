class CommentsController < ApplicationController

# TODO other controllers : issues, attachements
 def edit
 
 end


 def update
 	@news.comments.find(params[:comment_id]).update(comment_params)
 	render :action => 'update'
 	Redmine::Hook::listener::Eventracker.everntracker(comment_params)
 end

 private

def comment_params
	params(:comment).require(:commented_type, :commented_id, :author)
end
	
end

