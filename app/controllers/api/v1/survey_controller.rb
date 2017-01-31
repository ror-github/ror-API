module Api
  class V1::SurveyController < V1::BaseController
    #befor_action :authenticate

    def survey_list
      if params[:status] && params[:status] != 'all'
        surveys = Survey.select(:id, :title, :description, :price, :status).where(status: params[:status])
      else
        surveys = Survey.select(:id, :title, :description, :price, :status)
      end
      render json: { status: 200, list: surveys }
    end

    def survey
      survey = Survey.find(params[:id])
      render json: { status: 200, survey: survey }
    end

  end
end