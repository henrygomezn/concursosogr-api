class Api::V1::AtajosController < ApplicationController

   def dashboard


  render json: {contUsuarios: Usuario.count,contCompetidores: Competidor.count, contVotos: Voto.count, contNoticias: Notice.count}, status: :ok
    end
end
