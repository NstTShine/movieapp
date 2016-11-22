class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :likes
  searchkick

  validates :name, presence: true, length: {maximum: 50}
  enum role: [:admin, :member, :guest]

  has_attached_file :avatar, styles: {small: "48x48#"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  scope :latest, -> {order created_at: :desc}

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
        user.save
      end
    end
  end

  def is_user? user
    self.id == user.id
  end
end
