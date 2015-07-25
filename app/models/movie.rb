class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :title,
    presence: true
  validates :director,
    presence: true
  validates :runtime_in_minutes,
    numericality: { only_integer: true }
  validates :description,
    presence: true
  validates :poster_image_url,
    presence: true
  validates :release_date,
    presence: true

  scope :less_than_90, -> { where("runtime_in_minutes: < 90")}
  scope :between_90_and_120, -> { where("90 < runtime_in_minutes < 120")}
  scope :greater_than_120, -> { where("runtime_in_minutes > 120")}

  def review_average
    if reviews.size > 0
      average = reviews.sum(:rating_out_of_ten)/reviews.size
      "#{average}/10"
    else
      "No reviews yet!"
    end
  end

  mount_uploader :poster_image_url, AvatarUploader

  protected
  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end

  def self.search(query)
    where("director LIKE ? OR title LIKE ?", "%#{query}%", "%#{query}%")
  end

end
