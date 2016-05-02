class OptionCategory < ActiveRecord::Base
  belongs_to :menu
  has_many :menu_options, dependent: :destroy
  accepts_nested_attributes_for :menu_options, reject_if: :all_blank, allow_destroy: true
  belongs_to :restaurant_owner, :class_name => "User", :foreign_key => "restaurant_owner_id"
  validates_presence_of :name
end
