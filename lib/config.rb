require "singleton"

module Eventracker
 class Config
  include Singleton
  include ActiveModel::Mode;

  attr_accessor :webhook_url

  def initialize 
   @webhook_url = "http://www.example.com"
  end
 end
end