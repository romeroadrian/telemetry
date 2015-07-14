class Api::EventsController < Api::BaseController
  before_action :fetch_installation, only: [:create]

  def create
    event = @installation.events.build(events_params)
    if event.save
      render json: event
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def fetch_installation
    @installation = Installation.find_by(uuid: params[:installation_id])
  end

  def events_params
    params.require(:event).permit(:kind, :payload)
  end

end
