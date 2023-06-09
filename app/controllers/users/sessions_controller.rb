# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private
    def respond_with(resource, _opts = {})
      render json: resource.as_json.merge({ accessToken: request.env['warden-jwt_auth.token'] }), status: :ok
    end

    def respond_to_on_destroy
      current_user ? log_out_success : log_out_failure
    end

    def log_out_success
      render json: { message: "Desconectado com sucesso." }, status: :ok
    end

    def log_out_failure
      render json: { message: "Falha ao se desconectar."}, status: :unauthorized
    end
end
