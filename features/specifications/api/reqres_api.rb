class ReqresApi < BaseAPI
    base_uri BASE_URL['reqres']

    def create(request_body)
        # request_body = {
        #     "name": name,
        #     "job": job
        # }
        self.class.post('/api/users', headers: @request_header, body: request_body.to_json, timeout: 30)
    end

    def read(user_id)
        self.class.get("/api/users/#{user_id}", headers: @request_header, timeout: 30)
    end

    def update(user_id, request_body)
        request_body = {
            "name": name,
            "job": job
        }
        self.class.put("/api/users/#{user_id}", body: request_body.to_json, headers: @request_header, timeout: 30)
    end

    def delete(user_id)
        self.class.delete("/api/users/#{user_id}", headers: @request_header, timeout: 30)
    end

end