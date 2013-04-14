class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
  attr_accessible :postion
  attr_accessible :visible
  attr_accessible :created_at

  has_many :pages

  validates_presence_of :name

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
