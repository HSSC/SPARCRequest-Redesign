class BaseController < ApplicationController
  def home
    respond_to :html
  end

  def contributions
    respond_to :html
  end
end
