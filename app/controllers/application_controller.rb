class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user, unless: :devise_controller?

  before_action :request_path
  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:gender])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:residence_id])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:age_id])
    end

    def set_user
      @sideUser = User.find_by(id: current_user.id)
    end
end
