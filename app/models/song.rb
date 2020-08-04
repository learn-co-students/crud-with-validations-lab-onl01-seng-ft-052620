class Song < ApplicationRecord
  validates_presence_of :title
  validate :same_artist_year
  validates_inclusion_of :released, {in: [true, false]}
  validate :future_release
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: :current_year}, if: :released






  private

  def current_year
    Time.now.year
  end

  def future_release
    if self.release_year && self.release_year > current_year
      errors[:release_year] << "Cannot be released in the future"
    end
  end

  def same_artist_year
    if Song.all.any? {|s| s.title == self.title && s.release_year == self.release_year && s.artist_name == self.artist_name}
      errors[:title] << "Cannot create same song for same artist in the same year"
    end
  end

end
