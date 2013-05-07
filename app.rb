# -*- coding: utf-8 -*-


require "#{DIR}/lib/send_notify"

class Awake < Sinatra::Base
  set :public_folder, "#{DIR}/public"
  set :views, "#{DIR}/views"

  configure :development do
   Bundler.require :development
   register Sinatra::Reloader
  end


  get '/' do
    erb :index
  end

  post '/' do
    redirect '/' if params[:message] != 'awake'

    5.times do
      send_notify("#{DIR}/conf/nma", '起きろ，やまま！！', '', '', NMA::Priority::EMERGENCY)
    end

    '{message: success}'
  end
end
