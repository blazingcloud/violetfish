require 'faker'
require 'factory_girl'

Factory.define :article do |f|
  word1 = ["Using", "Starting with", "Understanding", "Coding", "Getting into"]
  word2 = %w(Rails Gems Bundler Ruby Sinatra)
  f.title { word1.rand + " " + word2.rand }
  f.url { |a| "http://soemthing.com/" + a.title.gsub(' ', '-').downcase } 
  f.author { Faker::Name.name }
  f.published_on Date.today - 1.year
end
