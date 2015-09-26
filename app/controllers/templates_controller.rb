class TemplatesController < ApplicationController

  def nothing
  end

  def index
    render 'index', layout: nil
  end

  def sign_in
    render 'sign_in', layout: nil
  end

  def sign_up
    render 'sign_up', layout: nil
  end
end
