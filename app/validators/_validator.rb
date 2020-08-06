class TitleValidator < ActiveModel::Validator
    def validate(record)
      if 
        record.errors[:title] << "We're only allowed to have people who work for the company in the database!"
      end
    end
  end