class ApplicationController < ActionController::Base
include Redmine::Hook::Helper
include EventrackerHookListener
end