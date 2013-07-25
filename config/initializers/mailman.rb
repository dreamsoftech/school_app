# !/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require "mailman"
require "daemons"
require "rake"

#Mailman.config.logger = Logger.new("log/mailman.log")  # uncomment this if you can want to #create a log file
Mailman.config.poll_interval = 3  # change this number as per your needs. Default is 60 seconds
Mailman.config.imap = {
  server: 'imap.gmail.com', port: 993, ssl: true,
  enable_starttls_auto: true,
  authentication: 'plain',
  username: 'reedkevin88@gmail.com',
  password: 'fanatic8822'
}

# Daemons.run(File.dirname(__FILE__) + "/script/mailman_server.rb start")
