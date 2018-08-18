class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook,
    :google_oauth2]

  validates :email, presence: true, length: {maximum: 255},
    format: {with: Devise.email_regexp}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {within: Devise.password_length}, allow_nil: true
  validates :name, presence: true, length: {maximum: 50}

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :activities, dependent: :destroy
  scope :load_farmers, -> { where role: "Farmer" }
  mount_uploader :avatar, AvatarUploader

  enum sex: [:male, :female]

  class << self
    def from_omniauth auth
      email = auth.provider + "_" + auth.info.email
      user = where(email: email, provider: auth.provider).first
      unless user
        user = User.new provider: auth.provider, email: email,
          password: Devise.friendly_token[0,20], name: auth.info.name,
          avatar_cloud: auth.info.image
        user.save
      end
      user
    end
  end

  def current_user? user
    self == user
  end

  def liked? post
    activities.find_by post: post, activity_type: :like
  end

  def disliked? post
    activities.find_by post: post, activity_type: :dislike
  end

end
