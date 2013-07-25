class WidgetsController < ApplicationController
  before_filter :authenticate_user!
  def create
  end

  def update
  end

  def edit
  end

  def new
  end

  def index
    @widgets = Widget.all
  end
end
