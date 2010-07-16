class Version < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :tech

  def display_name
   tech.name + " " + name
  end
end
