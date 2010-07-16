class Tech < ActiveRecord::Base
  validates_presence_of :name
  has_many :versions
end
