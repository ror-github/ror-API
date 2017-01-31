module Api  
  module V1
    class TaskControllerTest < ActionDispatch::IntegrationTest
      test "list to provide all task list for survey" do
        get '/api/v1/task_list/1.json'
        assert_equal 200, response.status
        assert_equal 3, JSON.parse(response.body)['list'].size
        assert_equal Hash, JSON.parse(response.body).class
      end

      test "list with invalid surveyID" do
        get '/api/v1/task_list/12.json'
        assert_equal 0, JSON.parse(response.body)['list'].size
      end
    end
  end
end