module AdminScript
  module Controller
    extend ActiveSupport::Concern

    included do
      before_action :set_admin_script_class, only: [:show, :perform]
      append_view_path(File.expand_path('../../../app/views', __FILE__))

      helper_method :admin_script_path, :admin_scripts_path
    end

    def index
      @admin_scripts = AdminScript::Base.subclasses.sort_by(&:to_s).map(&:new)
      render 'admin_scripts/index'
    end

    def show
      @admin_script = @admin_script_class.new(admin_script_params)
      render 'admin_scripts/show'
    end

    def update
      @admin_script = @admin_script_class.new(admin_script_params)

      success = @admin_script.perform!
      location = @admin_script.location_url || { action: :index }

      if success
        redirect_to location, notice: t('messages.success')
      else
        flash.now[:alert] = t('messages.fail')
        render 'admin_scripts/show', status: :unprocessable_entity
      end
    end

    private

    def admin_script_params
      params.require(:admin_script).permit(*@admin_script_class.type_attributes.keys)
    rescue ActionController::ParameterMissing
      nil
    end

    def set_admin_script_class
      @admin_script_class = AdminScript::Base.find_class(params[:id])
    end

    # TODO: 適当すぎるのでrouterに載せる
    def admin_script_path(id)
      param = id&.to_param || id
      "/admin_scripts/#{param}"
    end

    def admin_scripts_path
      '/admin_scripts'
    end
  end
end
