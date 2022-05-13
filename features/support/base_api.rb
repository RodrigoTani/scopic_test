class BaseAPI
    include HTTParty

    base_uri BASE_URL['reqres']
    format :json

    def initialize
        @request_header = self.class.headers
        @request_header.merge!("Accept-Language" => "pt-BR,pt;q=0.9")
        @request_header.merge!("content-type" => "application/json; charset=utf-8")
    end
    
end