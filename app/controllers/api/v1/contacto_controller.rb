class Api::V1::ContactoController < ApplicationController
    load_and_authorize_resource class: "Contacto"

    def index
        contacto = Contacto.all
        render json: contacto, status: :ok

    end

    def create
        contacto = Contacto.new(contacto_params)
        if contacto.save
            render json: contacto, status: :ok
        else
            render json: "error", status: :unprocessable_entity
        end
    end




    private
    def contacto_params
        params.permit(:nombre, :correo,:mensaje,:status)
    end
end
