class ImportSessionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @import_session  = ImportSession.new
    @import_sessions = ImportSession.all
  end

  def show
    @import_session = ImportSessionDecorator.new(ImportSession.find(params[:id]))
  end

  def create
    uploaded_file        = import_session_params[:data_file].tempfile
    transaction_importer = TransactionImporter.new(uploaded_file, current_admin)
    import_session       = transaction_importer.import

    redirect_to import_session_path(import_session), notice: I18n.t("import_sessions.success")
  rescue TransactionImporterError
    redirect_to root_url, alert: I18n.t("import_sessions.failure")
  end

  def import_session_params
    params.require(:import_session).permit(:data_file)
  end
end
