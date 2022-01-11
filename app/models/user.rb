class User < ApplicationRecord
  belongs_to :job_type

  def job_type_category
    if self.job_type.blank?
      ' - '
    else
      self.job_type.category
    end
  end
end