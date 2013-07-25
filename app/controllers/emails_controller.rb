class EmailsController < ApplicationController
  before_filter :authenticate_user!
  def create
  end

  def update
  end

  def edit
    redirect_to emails_path
  end

  def new
  end

  def index
    @emails = Email.all
  end
end
