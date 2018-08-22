require "singleton"

module Eventracker
 class Config
  include Singleton
  include ActiveModel::Model

  attr_accessor :webhook_url

  def initialize(attributes={})
  	super
   @webhook_url = "http://www.example.com"
  end

  def persisted?
  	true
  end
  
 end
end