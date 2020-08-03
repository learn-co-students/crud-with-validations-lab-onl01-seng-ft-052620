class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    with_options if: :released? do |song|
        song.validates :release_year, presence: true, numericality: { less_than: Date.today.year }
    end

    
    def released?
        released
    end

end
