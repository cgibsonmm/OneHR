class Profile < ApplicationRecord
  belongs_to :client

  def incomplete_profile?
    !completed
  end
end
