class ReqresApiModels
    include Helpers

    def initialize
        @reqres_api = ReqresApi.new
    end

    def create_user(name, job)
        request_body = {
            "name": name,
            "job": job
        }

        @last_response = @reqres_api.create(request_body)
    end

    def read_user(user_id = nil)
        $scenario_data["user_id"] = user_id

        @last_response = @reqres_api.read(user_id)
        expect_response_code(@last_response.code, 200, "Error to read the USER")

        if @last_response.blank?
            raise "The route response is blank!"
        end

        print "\tUser returned successfully! \n\tUsername: #{ @last_response["data"]["first_name"] + " " + @last_response["data"]["last_name"]} User_ID: #{ @last_response["data"]["id"]}\n"
    end

    def delete_user(user_id = nil)
        $scenario_data["user_id"] = user_id

        @last_response = @reqres_api.delete($scenario_data["user_id"])
        expect_response_code(@last_response.code, 204, "Error to delete the USER")
    end

    def validate(expect)
        expect_response_code(@last_response.code, 201, "Error to create the USER")

        if @last_response["name"].blank?
            raise "The route created a user with blank name! \n\tGET: #{@last_response["name"]}"
        elsif @last_response["job"].blank?
            raise "The route created a user with blank job! \n\tGET: #{@last_response["job"]}"
        elsif @last_response["id"].blank?
            raise "The ID from API Create returned blank \n\tGET: #{@last_response["id"]}"
        elsif @last_response["createdAt"].blank?
            raise "The API doens't retuned SYSDate \n\tGET: #{@last_response["createdAt"]}"
        end
    end

    def list_users
        @last_response = @reqres_api.list_users
        expect_response_code(@last_response.code, 200, "Error in list_users api")

        if @last_response.blank?
            raise "The List/Users returned blank."
        end
        if @last_response['total'] == 0
            raise "Don't have any users registered."
        end
    end
end