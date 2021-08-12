class Api::V1::CompetidorController < ApplicationController
    load_and_authorize_resource class: "Competidor"

    include ActionController::MimeResponds

    def index
        competidors = Competidor.all
        render json: competidors, status: :ok
    end
 
    def create
        competidor = Competidor.new(competidor_params)
        if competidor.save
            if competidor.cover_picture.attached?
                competidor.update_column(:urlAvatar, Rails.application.routes.url_helpers.rails_blob_path(competidor.cover_picture, only_path: true))
            end
            if competidor.cover_pdf.attached?
                competidor.update_column(:urlPdf, Rails.application.routes.url_helpers.rails_blob_path(competidor.cover_pdf, only_path: true))
            end

            render json: competidor, status: :ok
        else
            render json: "error", status: :unprocessable_entity
        end
    end

  # PATCH/PUT /competitors/1 or /competitors/1.json
  def update
    competidor = Competidor.find(params[:id])
  
    

      if competidor.update(competidor_params)
        if competidor.cover_picture.attached?
            competidor.update_column(:urlAvatar, Rails.application.routes.url_helpers.rails_blob_path(competidor.cover_picture, only_path: true))
        end
        if competidor.cover_pdf.attached?
            competidor.update_column(:urlPdf, Rails.application.routes.url_helpers.rails_blob_path(competidor.cover_pdf, only_path: true))
        end
        render json: competidor, status: :ok
      
    
      else      
      render json: competidor.errors, status: :unprocessable_entity 
      end
  
  end


 def mostrarFicha

    competidor = Competidor.find(params[:id])
 
        render json: competidor, status: :ok
      
 end


 def contadorVotos
 
  

 competidor = Competidor.find(params[:id])
 
 contador = competidor.contVotos + 1

 competidor.update_column(:contVotos, contador)

 render json: {mensaje: "Suma realizada con exito"}, status: :ok

 end

 def eliminarCuento
    competidor = Competidor.find(params[:id])
    
    if competidor.destroy
        render json: {mensaje: "Cuento eliminado con exito"}, status: :ok
    else
         render json: competidor.errors, status: :unprocessable_entity 
    end

end

    def ultimosCompetidores
     lastCompetidors = Competidor.order(created_at: :desc).first(6)
 
     render json: lastCompetidors, status: :ok

    end


    def masVotados
        masVotados = Competidor.order(contVotos: :desc).first(3)
    
        render json: masVotados, status: :ok
   
       end

    def misParticipaciones 
        misParticipaciones = Competidor.where(params.permit(:usuario_id))
        render json: misParticipaciones, status: :ok
       end

       def buscarxId
        competidor = Competidor.find(params[:id])
    
        render json: competidor, status: :ok
    end

    def buscarxTitulo
       
        string = params.permit(:titulo)
    
        competidor2 = Competidor.where('titulo LIKE ?', "%#{string[:titulo]}%").all

        render json: competidor2, status: :ok
    end


    private
    def competidor_params
        params.permit(:titulo, :descripcion, :usuario_id, :concurso_id, :autor, :contVotos, :cover_picture,:cover_pdf)
    end

   
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_competidor
      @competidor = Competidor.find(params[:id])
    end
  





end
