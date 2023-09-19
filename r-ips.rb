# frozen-string-literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem "rails", github: "rails/rails"
end

require 'action_controller/railtie'

class App < Rails::Application
  config.secret_token = '1234567890'*5
  config.secret_key_base = 'foo'
  config.eager_load = true
  config.active_support.deprecation = :stderr
  config.middleware.delete(ActionDispatch::ShowExceptions)
  config.middleware.delete(Rack::Lock)
  config.middleware.use(Rack::ContentLength)
  config.logger = Logger.new('/dev/null')
  config.logger.level = 4
  config.log_level = :error 
end

class ApplicationController < ActionController::Base
  def route_not_found
    head 404
  end
end

class MainController < ApplicationController
  def a
    render :html=>"4797-#{params[:a]}"
  end
  def b
    render :html=>"4798-#{params[:a]}"
  end
  def c
    render :html=>"4799-#{params[:a]}"
  end
  def d
    render :html=>"47100-#{params[:a]}"
  end
  def e
    render :html=>"47101-#{params[:a]}"
  end
  def f
    render :html=>"47102-#{params[:a]}"
  end
  def g
    render :html=>"47103-#{params[:a]}"
  end
  def h
    render :html=>"47104-#{params[:a]}"
  end
  def i
    render :html=>"47105-#{params[:a]}"
  end
  def j
    render :html=>"47106-#{params[:a]}"
  end
end

App.initialize!

App.routes.clear!

App.routes.draw do
  get '/a/:a' => 'main#a'
  get '/b/:a' => 'main#b'
  get '/c/:a' => 'main#c'
  get '/d/:a' => 'main#d'
  get '/e/:a' => 'main#e'
  get '/f/:a' => 'main#f'
  get '/g/:a' => 'main#g'
  get '/h/:a' => 'main#h'
  get '/i/:a' => 'main#i'
  get '/j/:a' => 'main#j'
  match '*unmatched', to: 'application#route_not_found', via: :all
end
