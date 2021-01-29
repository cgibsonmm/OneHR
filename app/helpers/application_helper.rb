module ApplicationHelper
  def display_nav_bar
    public_routes = ['/sign-up']
    route = request.path

    render partial: 'shared/navbar' unless public_routes.include? route
  end
end
