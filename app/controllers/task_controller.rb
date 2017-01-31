class TaskController < ApplicationController
  def list
    # @task = Task.where survey_id: params[:surveyId]
    @task = Task.select(:id, :survey_id, :taskname, :description, :price, :status).where(survey_id: params[:surveyId])
    render json: { status: 200, list: @task }
  end
end
