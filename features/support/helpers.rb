# Helpers
module Helpers
    def expect_response_code(obtained, expect = 200, message = nil)
        description = ""

        case obtained
        when 400
          description = "Requisição com sintaxe inválida\n#{message}.\n\n\n"
        when 401
          description = "Necessário autenticação para obter resposta\n#{message}.\n\n\n"
        when 500
          description = "Erro interno do servidor\n#{message}.\n\n\n"
        when 502
          description = "Servidor/Aplicação não encontrada\n#{message}.\n\n\n"
        when 504
          description = "Timeout\n#{message}.\n\n\n"
        else
          description = "Não especificado no método"
        end

        unless obtained == expect
          raise "\n[ERROR] Expect code: #{expect}\nObtained code: #{obtained} - #{description}\n#{message}.\n\n\n"
        end
    end
end
World Helpers