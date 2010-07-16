class Version < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :tech
end
