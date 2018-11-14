#!/usr/bin/env ruby

require 'rack-google-analytics'
require 'sinatra'
require 'slim'
require 'pony'

use Rack::GoogleAnalytics, tracker: ENV['GA_CODE']

get '/' do
  slim :index
end

post '/' do
  if params.delete(:email).empty?
    if params.values.any?(&:empty?)
      status 500
      body 'Необходимо заполнить все поля!'
    else
      Pony.mail({
        to: ENV['EMAIL_DESTINATION'],
        from: 'Bender Rodriguez <bot@eterra-media.ru>',
        subject: 'Сообщение через форму на eterra-media.ru',
        body: "Имя: #{params[:name]}\nПочта: #{params[:real_email]}\nТекст: #{params[:text]}",
        via: :smtp,
        via_options: {
          address: 'smtp.gmail.com',
          port: '587',
          enable_starttls_auto: true,
          user_name: ENV['EMAIL_USERNAME'],
          password: ENV['EMAIL_PASSWORD'],
          authentication: :plain,
          domain: 'eterra-media.ru'
        }
      })

      status 200
      body 'Сообщение успешно отправлено!'
    end
  else
    status 200
  end
rescue
  status 500
  body 'Произошла ошибка. Повторите попытку позже.'
end
