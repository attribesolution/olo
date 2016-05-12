class User < ActiveRecord::Base
  rolify
  after_initialize :set_default_role, :if => :new_record?
  before_create :generate_api_key
  before_create :generate_passcode
  # after_create :notify_admin

  has_many :categories, :class_name => "Category", :foreign_key => "restaurant_owner_id"
  has_many :menus, :class_name => "Menu", :foreign_key => "restaurant_owner_id"
  has_many :device_table_mappings, :class_name => "DeviceTableMapping", :foreign_key => "restaurant_owner_id"
  has_many :option_categories, :class_name => "OptionCategory", :foreign_key => "restaurant_owner_id"
  has_many :questions, :class_name => "Question", :foreign_key => "restaurant_owner_id"
  
  # has_many :taxations
  # has_many :taxes, through: :taxations

  mount_uploader :logo, LogoUploader
  mount_uploader :background_image, BackgroundImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def set_default_role
    self.add_role :restaurant_owner
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def notify_admin
    AdminMailer.new_user_waiting_for_approval(self).deliver_now
  end

  private
    def generate_api_key
      self.api_key = SecureRandom.uuid
    end

    def generate_passcode
      passcode = rand(6 ** 6)
      while User.where(:passcode => passcode).exists? do
        passcode = rand(6 ** 6)
      end
      self.passcode = passcode
    end

end
