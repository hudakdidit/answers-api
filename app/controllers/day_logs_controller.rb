class DayLogsController < ApplicationController
  before_action :set_day_log, only: [:show, :update, :destroy]

  # GET /day_logs
  def index
    @day_logs = DayLog.all
    json_response(@day_logs)
  end

  # POST /day_logs
  def create
    @day_log = DayLog.create!(day_log_params)
    json_response(@day_log, :created)
  end

  # GET /day_logs/:id
  def show
    json_response(@day_log)
  end

  # PUT /day_logs/:id
  def update
    @day_log.update(day_log_params)
    head :no_content
  end

  # DELETE /day_logs/:id
  def destroy
    @day_log.destroy
    head :no_content
  end

  private

  def day_log_params
    # whitelist params
  end

  def set_day_log
    @day_log = DayLog.find(params[:id])
  end
end
