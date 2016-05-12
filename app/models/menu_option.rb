class MenuOption < ActiveRecord::Base
	belongs_to :option_category
	validates_presence_of :name
  validates :price, :numericality => { :greater_than => -1 }
end
