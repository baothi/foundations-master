class SettingsController < ApplicationController

  def index
    FoundationsConstants::SETTING_KEYS.each do |key|
      Setting.find_or_create_by(key: key)
    end
    @settings = Setting.all
  end

  def update_all
    params[:settings].each_with_index do |value, index|
      key = value[0]
      setting = Setting.find_or_create_by(key: key)
      setting.value = value[1]
      setting.save
    end
    # params[:settings].each do |key|
    #   puts key
    #   # setting = Setting.find_or_create_by(key: key)
    #   # setting.value = params[key]
    #   # setting.save
    # end
    redirect_to settings_path, notice: 'Successfully saved Settings.'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def setting_params
    params.require(:setting).permit(:key, :value)
  end

end
