class RepeatTitleValidator < ActiveModel::Validator
    def validate(record)
      matching_songs = record.class.same_artist_year(record.artist_name, record.release_year)
      matching_titles = matching_songs.map{|song| song.title}
      if matching_titles.include?(record.title)
        record.errors[:title] << "Cannot use title already used by the same artist in the same year"
      end
    end
  end 