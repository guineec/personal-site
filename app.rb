# frozen_string_literal: true

require 'sinatra'

# Require files in models and lib directories
Dir['./models/*.rb'].each { |file| require file }
Dir[File.join('./lib', '**/*.rb')].each { |file| require file }

get '/' do
  erb :home, locals: { page_name: 'Home' }
end

get '/covid19' do
  erb :covid, locals: { page_name: 'COVID-19' }
end

get '/:slug' do |slug|
  erb slug.to_sym, locals: { page_name: slug.capitalize }
rescue Errno::ENOENT
  erb :not_found, locals: { page_name: "404 - Not found" }
end

not_found do
  erb :not_found, locals: { page_name: "404 - Not found" }
end
