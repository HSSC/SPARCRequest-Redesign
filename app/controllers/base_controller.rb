class BaseController < ApplicationController
  def home
    respond_to :html
  end

  def dashboard
    respond_to :html
  end
end
