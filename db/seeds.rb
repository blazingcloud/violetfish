# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

ruby = Tech.create(:name =>"Ruby")
ruby.versions.create(:name => "1.8.6")
ruby.versions.create(:name => "1.8.7")
ruby.versions.create(:name => "1.8.x")
ruby.versions.create(:name => "1.9.x")
ruby.versions.create(:name => "1.9.1")


rails = Tech.create(:name =>"Rails")
rails.versions.create(:name => "1.x")
rails.versions.create(:name => "2.0.x")
rails.versions.create(:name => "2.1.x")
rails.versions.create(:name => "2.2.x")
rails.versions.create(:name => "2.3.x")
rails.versions.create(:name => "2.x")
rails.versions.create(:name => "3.x")

rspec = Tech.create(:name =>"RSpec")
rspec.versions.create(:name => "2")
rspec.versions.create(:name => "3")
