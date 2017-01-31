Rails.application.routes.draw do
  get 'survey', to: 'survey#list'
  get '/surveys', to: 'survey#list'
  get 'survey/list'
  get 'survey/list/:status', to: 'survey#list'
  get 'survey/new'
  post 'survey/create'
  get 'survey/show'
  get 'survey/show/:surveyId', to: 'survey#show' 
  get 'survey/edit/:id', to: 'survey#edit'
  patch 'survey/update'
  get 'survey/update'
  get 'survey/delete'
  get 'task/list/:surveyId', to: 'task#list'

  namespace :api do
    namespace :v1 do
      get 'survey_list(/:status)', to: 'survey#survey_list'
      get 'survey/:id', to: 'survey#survey'
      get 'task_list(/:surveyId)', to: 'task#task_list'
    end
    # namespace :v2 do
    #   get 'survey_list', to: 'survey#survey_list'
    #   get 'survey', to: 'survey#survey'
    # end
  end
end
