class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
  attr_accessible :postion
  attr_accessible :visible

  has_many :pages

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
