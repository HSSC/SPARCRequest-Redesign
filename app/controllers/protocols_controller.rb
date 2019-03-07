class ProtocolsController < ApplicationController
  layout :determine_layout

  before_action :find_protocol, except: [:index]

  def index
  end

  def show
  end

  def validate
    unless @protocol.group_valid?(params[:group].underscore.to_sym)
      @errors = @protocol.errors
    end

    respond_to :js
  end

  def details
    @type = params[:type]

    respond_to :html
  end

  private

  def find_protocol
    @protocol = session[:protocol_id] ? Protocol.find(session[:protocol_id]) : params[:type].constantize.new
  end

  def determine_layout
    case action_name
    when 'index', 'show'
      'dashboard'
    else
      'protocols'
    end
  end
end
