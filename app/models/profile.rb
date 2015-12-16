class Profile < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :gender, :in => %w(male female)
  validate :permit_either_first_or_last_name_to_be_null,
           :cannot_be_male_if_name_is_sue

  def permit_either_first_or_last_name_to_be_null
    errors.add(:first_name, "name can't be null") if
      first_name.nil? && last_name.nil?
  end

  def cannot_be_male_if_name_is_sue
    errors.add(:gender, "cannot be male if name is Sue") if
      first_name == 'Sue' && gender == 'male'
  end

  def self.get_all_profiles(startYear, endYear)
    where("birth_year BETWEEN #{startYear} AND #{endYear}").order(birth_year: :asc)
  end
end
