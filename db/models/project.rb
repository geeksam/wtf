class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :slug
end
