require 'sinatra'
require 'foursquare2'
require 'haml'
require 'dotenv'

Dotenv.load

set :root, File.dirname(__FILE__)
set :public_folder, Proc.new { File.join(root, "assets") }

client = Foursquare2::Client.new(:oauth_token => ENV['FOURSQUARE_TOKEN'], api_version: '20140226')

get '/' do
  @res = client.user_checkins(limit: 1).items[0].venue
  haml :index
end
