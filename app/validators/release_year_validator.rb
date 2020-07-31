class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released and record.release_year.blank?
      record.errors[:release_year] << "Release year can't be blank if song has been released"
    end
  end
end
