# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
    def respond_with(resource, _opts = {})
      resource.persisted? ? register_success : register_failed
    end

    def register_success
      render json: { message: 'Cadastrado com sucesso.' }
    end
    
    def register_failed
      render json: { message: "Falha ao se cadastrar: #{resource.errors.full_messages.join(",")}." }
    end
end
