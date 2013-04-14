class Section < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :page_id
  attr_accessible :name
  attr_accessible :visible
  attr_accessible :position
  attr_accessible :content_type
  attr_accessible :content

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  validates_presence_of :name
  
end
