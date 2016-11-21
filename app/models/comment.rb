class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  paginates_per Settings.comment.per_page

  delegate :name, :avatar, to: :user

  validates :content, presence: true, length: {maximum: 200}

  scope :newest, -> {order created_at: :desc, updated_at: :desc}
  scope :oldest, -> {order created_at: :asc, updated_at: :asc}

  ATTRIBUTES_PARAMS = :content, :user_id, :movie_id

  def exist_avatar
    self.user.avatar_file_name.nil?
  end

  def find_user_with_comment
    @user = self.user
  end

  scope :with_user, -> () {
    self.select("users.name", "users.avatar").joins(:user).includes :user
  }

  class << self
    def find_by_movie movie_id
      self.with_user.where(movie_id: movie_id)
        .order("comments.created_at DESC")
    end
  end
end
