class ReqresApiModels
    include Helpers

    def create_user(name, job)
        @reqres_api = ReqresApi.new

        request_body = {
            "name": name,
            "job": job
        }

        @last_response = @reqres_api.create(request_body)
        expect_response_code(@last_response.code, 201, "Error to create the USER")

        if @last_response["name"].blank?
            raise "The route is not allowed to create a user with blank name! \n\tGET: #{@last_response["name"]}"
        elsif @last_response["job"].blank?
            raise "The route is not allowed to create a user with blank job! \n\tGET: #{@last_response["job"]}"
        elsif @last_response["id"].blank?
            raise "The ID from API Create returned blank \n\tGET: #{@last_response["id"]}"
        elsif @last_response["createdAt"].blank?
            raise "The API doens't retuned SYSDate \n\tGET: #{@last_response["createdAt"]}"
        end
    end

    def validate
        
    end
end