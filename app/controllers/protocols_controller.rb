class ProtocolsController < ApplicationController
  layout 'request'

  def details
    @type = params[:type]

    respond_to :html
  end
end
