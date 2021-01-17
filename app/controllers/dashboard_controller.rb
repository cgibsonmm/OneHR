class DashboardController < ApplicationController
  before_action :authenticate_user!
  # Needs counts for pending things

  def index
    @requisitions = current_user.requisitions.length
  end
end
