class Api::V1::ConcursoController < ApplicationController
    load_and_authorize_resource class: "Concurso"

    def index
        concurso = Concurso.all
        render json: concurso, status: :ok
    end

    def create
        concurso = Concurso.new(concurso_params)
        if concurso.save
            render json: concurso, status: :ok
        else
            render json: "error", status: :unprocessable_entity
        end
    end

    def eliminarConcurso
        concurso = Concurso.find(params[:id])
        
        if  concurso.destroy
            render json: {mensaje: "Concurso eliminado con exito"}, status: :ok
        else
             render json: concurso.errors, status: :unprocessable_entity 
        end
    
    end

    private
    def concurso_params
        params.permit(:nombre, :descripcion)
    end
end
