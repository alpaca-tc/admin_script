module AdminScript
  module Controller
    extend ActiveSupport::Concern

    included do
      before_action :set_admin_script_class, only: [:show, :perform]
    end

    # def _prefixes
    #   @_prefixes ||= if request
    #                    ["#{devise_mapping.scoped_path}/#{controller_name}"] + super
    #                  else
    #                    super
    #                  end
    # end

    def index
      @admin_scripts = AdminScript.subclasses.sort_by(&:to_s).map(&:new)
    end

    def show
      @admin_script = @admin_script_class.new(admin_script_params)
    end

    def perform
      @admin_script = @admin_script_class.new(admin_script_params)

      success = @admin_script.perform!
      location = @admin_script.location_url || admin_admin_scripts_path

      if success
        redirect_to location, notice: t('messages.success')
      else
        flash.now[:alert] = t('messages.fail')
        render :show, status: :unprocessable_entity
      end
    end

    private

    def admin_script_params
      params.require(:admin_script).permit(*@admin_script_class.type_attributes.keys)
    rescue ActionController::ParameterMissing
      nil
    end

    def set_admin_script_class
      @admin_script_class = AdminScript.find_class(params[:id])
    end
  end
end
