class Api::InstallationsController < Api::BaseController

  def create
    installation = Installation.new(installation_params.merge(ip: request.remote_ip))
    if installation.save
      render json: installation
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
  end

  private

  def installation_params
    params.require(:installation).permit(:admin_email, :application)
  end

end
