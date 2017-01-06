module AdminScript
  class AdminScriptsController < ApplicationController
    layout 'admin_script'

    before_action :set_admin_script_class, only: [:edit, :update]

    def index
      @admin_scripts = AdminScript::Base.subclasses.sort_by(&:to_s).map(&:new)
    end

    def edit
      @admin_script = @admin_script_class.new(admin_script_params)
    end

    def update
      @admin_script = @admin_script_class.new(admin_script_params)

      if @admin_script.save
        # TODO: Fixes path
        default_path = admin_script.routes.url_helpers.admin_scripts_path
        location = @admin_script.location_url.presence || default_path
        redirect_to location, notice: t('.successfully_performed')
      else
        flash.now[:alert] = t('.failed_performing')
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def admin_script_params
      params.require(:admin_script).permit(@admin_script_class.permitted_attributes)
    rescue ActionController::ParameterMissing
      nil
    end

    def set_admin_script_class
      @admin_script_class = AdminScript::Base.find_class(params[:id])
    end
  end
end
