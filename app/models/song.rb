class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.now.year}

end
