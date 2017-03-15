require 'bundler/setup'

task :environment do
  require_relative 'app'
end

task console: :environment do
  require 'pry'
  binding.pry
end

task :run do
  App.run!
end

