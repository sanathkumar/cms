require 'position_mover'
class Section < ActiveRecord::Base

  attr_accessible :page_id
  attr_accessible :name
  attr_accessible :visible
  attr_accessible :position
  attr_accessible :content_type
  attr_accessible :content

  include PositionMover

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  
  CONTENT_TYPES = ['text', 'HTML']
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, 
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.position ASC')
  
  private
  
  def position_scope
    "sections.page_id = #{page_id.to_i}"
  end
  
end