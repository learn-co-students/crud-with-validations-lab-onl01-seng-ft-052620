class Song < ApplicationRecord
    include ActiveModel::Validations
  
    scope :same_artist_year, -> (artist, year){where(artist_name: artist, release_year: year)}
  
    validates :title, :artist_name, presence: true
    validates_with RepeatTitleValidator
    validates_with ReleaseYearValidator
    validates_with FutureReleaseValidator
  end