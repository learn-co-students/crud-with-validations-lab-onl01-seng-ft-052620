class FutureReleaseValidator < ActiveModel::Validator
  def validate(record)
    if record.release_year
      unless record.release_year <= Date.today.year
        record.errors[:release_year] << "Cannot release a song in the future"
      end
    end
  end
end