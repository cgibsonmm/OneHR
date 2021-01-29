class ApplicationController < ActionController::Base
  # Pundit and pundit errors
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(Client) && resource.profile.incomplete_profile?
        client_profile_url
      else
        super
      end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
