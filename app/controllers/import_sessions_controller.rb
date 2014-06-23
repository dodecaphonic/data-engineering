class ImportSessionsController < ApplicationController
  def index
    @import_session = ImportSession.new
  end

  def show
    @import_session = ImportSession.find(params[:id])
  end

  def new
    @import_session = ImportSession.new
  end
end
