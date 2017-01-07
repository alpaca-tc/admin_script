class ::AdminScript::AdminScriptsController < AdminScript.configuration.parent_controller.constantize
  before_action :set_admin_script_class, only: [:edit, :update]

  def index
    @admin_scripts = AdminScript::Base.subclasses.sort_by(&:to_s).map(&:new)
  end

  def edit
    @admin_script = @admin_script_class.new(admin_script_params)
  end

  def update
    @admin_script = @admin_script_class.new(admin_script_params)

    if @admin_script.perform
      default_path = admin_script.routes.url_helpers.admin_scripts_path
      location = @admin_script.location_url.presence || default_path
      message = @admin_script.success_message.presence || t('admin_script.admin_scripts.update.successfully_performed')

      redirect_to location, notice: message
    else
      message = @admin_script.failure_message.presence || t('admin_script.admin_scripts.update.failed_performing')
      flash.now[:alert] = message

      render :edit, status: :unprocessable_entity
    end
  end

  private

  def admin_script_params
    params.require(:admin_script).permit(@admin_script_class.type_attributes.keys)
  rescue ActionController::ParameterMissing
    nil
  end

  def set_admin_script_class
    @admin_script_class = AdminScript::Base.find_class(params[:id])
  end
end
