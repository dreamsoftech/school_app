# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run DigestTeamMailer::Application
bundle exec rake mailman:start