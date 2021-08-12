class Api::V1::VotoController < ApplicationController
    load_and_authorize_resource class: "Voto"
    def index
        voto = Voto.all
        render json: voto, status: :ok
    end

    def create
        voto = Voto.new(voto_params)
        if voto.save
            render json: voto, status: :ok
        else
            render json: "error", status: :unprocessable_entity
        end
    end


    def verificarVoto
        
        aux = Voto.new(voto_params)

        if Voto.exists?(usuario_id: aux[:usuario_id]) and Voto.exists?(competidor_id: aux[:competidor_id]) and Voto.exists?(concurso_id: aux[:concurso_id])
    
            render json: {resp: false}, status: :ok
        else
            render json: {resp: true}, status: :ok


        end
        
        
    end




    private
    def voto_params
        params.permit(:concurso_id,:competidor_id,:usuario_id)
    end

end
