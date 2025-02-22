# frozen-string-literal: true

# Copyright (c) 2014-2021 Jeremy Evans
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#   
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#    
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
require 'action_controller/railtie'
class AppClass < Rails::Application
  if config.respond_to?(:load_defaults)
    config.load_defaults Rails::VERSION::STRING.to_f
  end
  if config.respond_to?(:yjit=)
    config.yjit = false
  end
  config.secret_key_base = 'foo'
  config.cache_classes = true
  config.eager_load = true
  config.public_file_server.enabled = false
  config.active_support.deprecation = :stderr
  config.middleware.delete(Rack::Lock)
  config.middleware.use(Rack::ContentLength)
  config.logger = Logger.new('/dev/null')
  config.logger.level = 4
  config.log_level = :error 
  routes.append do
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
  end
end
class ApplicationController < ActionController::Base
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
Rails.application.initialize!
App = Rails.application
