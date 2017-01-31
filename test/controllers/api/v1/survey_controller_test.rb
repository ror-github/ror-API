module Api  
  module V1
    class SurveyControllerTest < ActionDispatch::IntegrationTest
      test "list to provide all survey list as per given argument" do
        get '/api/v1/survey_list.json'
        assert_equal 200, response.status
        assert_equal 5, JSON.parse(response.body)['list'].size
        assert_equal Hash, JSON.parse(response.body).class
      end

      test "list to provide local survey list" do
        get '/api/v1/survey_list/local.json'
        assert_equal 2, JSON.parse(response.body)['list'].size
      end

      test "list to provide global survey list" do
        get '/api/v1/survey_list/global.json'
        assert_equal 1, JSON.parse(response.body)['list'].size
      end

      test "list to provide available survey list" do
        get '/api/v1/survey_list/available.json'
        assert_equal 1, JSON.parse(response.body)['list'].size
      end

      test "list to provide completed survey list" do
        get '/api/v1/survey_list/completed.json'
        assert_equal 1, JSON.parse(response.body)['list'].size
      end

      test "list with invalid argument" do
        get '/api/v1/survey_list/locals.json'
        assert_equal 0, JSON.parse(response.body)['list'].size
      end
      
      test "show to provide survey by ID" do
        survey = surveys(:local_1)
        get "/api/v1/survey/#{survey.id}.json"
        res = JSON.parse(response.body)['survey']
        assert_equal "Test Local",  res['title']
        assert_equal "local",  res['status']
        puts res.inspect
        assert_equal 200, response.status
      end

      test "show should raise exception for invalid survey ID" do
        assert_raises 'ActiveRecords' do
          get "/api/v1/survey/8.json"
        end
      end
    end
  end
end