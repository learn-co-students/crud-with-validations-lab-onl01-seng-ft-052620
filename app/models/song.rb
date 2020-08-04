class Song < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?

    validates :title, {presence: true, uniqueness: {scope: [:release_year,:artist_name]}}
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :release_year
    validates :artist_name, presence: true

    private

    def set_defaults
        self.released ||= false
    end

end
