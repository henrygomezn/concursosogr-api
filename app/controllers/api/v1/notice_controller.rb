class Api::V1::NoticeController < ApplicationController
    load_and_authorize_resource class: "Notice"

    def index
        notice = Notice.all
        render json: notice, status: :ok

    end

    def create
        notice = Notice.new(notice_params)
        if notice.save
            render json: notice, status: :ok
        else
            render json: "error", status: :unprocessable_entity
        end
    end

    def eliminarNoticia
        notice = Notice.find(params[:id])
        
        if  notice.destroy
            render json: {mensaje: "Noticia eliminado con exito"}, status: :ok
        else
             render json: notice.errors, status: :unprocessable_entity 
        end
    
    end


    def ultimasNoticias
        notice = Notice.order(created_at: :desc).first(3)
    
        render json: notice, status: :ok
   
       end

    private
    def notice_params
        params.permit(:titulo, :cuerpo)
    end
end
