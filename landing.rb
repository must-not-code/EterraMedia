#!/usr/bin/env ruby

require 'sinatra'
require 'slim'

get '/' do
  slim :index
end

__END__
@@ index
html
  head
    meta charset='utf-8'
    title E Terra
    link href='/apple-touch-icon.png' rel='apple-touch-icon' sizes='180x180'
    link href='/favicon-32x32.png' rel='icon' sizes='32x32' type='image/png'
    link href='/favicon-16x16.png' rel='icon' sizes='16x16' type='image/png'
  body
    img.logo src='logo.png'
css:
  html {
    background: url(../bg.png) no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
  }

  body {
  }

  .logo {
    max-width: 100%;
    position: absolute;
    left: 0;
    right: 0;
    margin: auto;
  }
