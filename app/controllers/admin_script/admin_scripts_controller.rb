class ::AdminScript::AdminScriptsController < AdminScript.configuration.parent_controller.constantize
  # FIXME: How to check parent layout?
  layout 'admin_script/application' unless _layout

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
      default_path = url_helpers.admin_scripts_path
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

  def url_helpers
    ::AdminScript::Engine.routes.url_helpers
  end

  def admin_script_params
    params.require(:admin_script).permit(@admin_script_class.attribute_types.keys)
  rescue ActionController::ParameterMissing
    nil
  end

  def set_admin_script_class
    @admin_script_class = AdminScript::Base.find_class(params[:id])
  end
end
