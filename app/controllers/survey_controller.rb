class SurveyController < ApplicationController
  layout 'standard'
  def list
    if params[:status] && params[:status] != 'all'
      @survey = Survey.select(:id, :title, :description, :price, :status).where(status: params[:status])
    else
      @survey = Survey.select(:id, :title, :description, :price, :status)
    end
  end
   
  def new
    @survey = Survey.new
  end
   
  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
   
  end
   
  def show
    if params[:surveyId]
      @survey = Survey.find(params[:surveyId])
      render json: @survey
    else
      @survey = Survey.find(params[:id])
    end
  end
   
  def edit
    @survey = Survey.find(params[:id])
  end
   
  def update
    @survey = Survey.find(params[:id])
    
    if @survey.update_attributes(survey_params)
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end
   
  def delete
    Survey.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description, :price, :status)
  end

end
