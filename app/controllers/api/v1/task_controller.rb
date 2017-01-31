module Api
  class V1::TaskController < V1::BaseController
    #befor_action :authenticate

    def task_list
      tasks = Task.select(:id, :survey_id, :taskname, :description, :price, :status).where(survey_id: params[:surveyId])
      render json: { status: 200, list: tasks }
    end

  end
end