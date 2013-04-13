class Page < ActiveRecord::Base

  attr_accessible :subject_id
  attr_accessible :position
  attr_accessible :permalink
  attr_accessible :name
  attr_accessible :visible
  # attr_accessible :permalink
  
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

end
