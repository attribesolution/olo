class MenuImage < ActiveRecord::Base
  belongs_to :menu

  mount_uploader :image, MenuImageUploader
end
