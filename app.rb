require 'yaml'

require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'gibbon'

Bundler.require(:default)

if ENV['RACK_ENV'] != 'production'
  config = YAML.load_file('./config.yml')
  config.each do |k,v|
    ENV[k] = v
  end
end

class LandingPage < Sinatra::Base
  get '/' do
    erb :index, :layout => :layout
  end

  post '/submit' do
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])

    email = params[:email]

    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(md5_email(email)).upsert(
      body: {
        email_address: email,
        status: "subscribed"
      }
    )

    redirect '/thanks'
  end

  get '/thanks' do
    erb :thanks, :layout => :layout
  end

  private

  def md5_email(email)
    Digest::MD5.hexdigest(email)
  end
end
