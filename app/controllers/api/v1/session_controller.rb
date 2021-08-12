class Api::V1::SessionController < ApplicationController
    def login
        auth = Authentication.new(login_params)
        if(auth.autenticar)
            render json: {token: auth.generar_token}, status: :ok
        else
            render json: {mensaje: "Correo o Contraseña incorrectos"}, status: :unprocessable_entity
        end
    end
    private
    def login_params
        params.permit(:correo, :password)
    end
end
