# Helpers
module Helpers
    def expect_response_code(obtained, expect = 200, message = nil)
        description = ""

        case obtained
        when 400
          description = "Bad request\n#{message}.\n\n\n"
        when 401
          description = "Unauthorized\n#{message}.\n\n\n"
        when 404
          description = "Not found\n#{message}.\n\n\n"
        when 500
          description = "Internal server error\n#{message}.\n\n\n"
        when 502
          description = "Bad gateway\n#{message}.\n\n\n"
        when 504
          description = "Gateway Timeout\n#{message}.\n\n\n"
        else
          description = "Not specified in method"
        end

        unless obtained == expect
          raise "\n[ERROR] Expect code: #{expect}\nObtained code: #{obtained} - #{description}"
        end
    end
end
World Helpers