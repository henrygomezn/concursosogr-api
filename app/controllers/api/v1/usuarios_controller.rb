class Api::V1::UsuariosController < ApplicationController
    load_and_authorize_resource class: "Usuario"
 

    def index
        usuarios = Usuario.all
        render json: usuarios, status: :ok
    end

    def create
        usuario = Usuario.new(usuario_params)
        
        if usuario.save
            render json: usuario, status: :ok
        else
             render json: usuario.errors, status: :unprocessable_entity 
        end
    end

    def show
        usuario = Usuario.find(params[:id])
        permisos = Ability.new(usuario).lista_de_permisos
        render json: {usuario: usuario, permisos: permisos}, status: :ok
    end

    def actual

        render json:current_user,status: :ok

    end

    def eliminarUsuario
        usuario = Usuario.find(params[:id])
        
        if usuario.destroy
            render json: {mensaje: "Usuario eliminado con exito"}, status: :ok
        else
             render json: usuario.errors, status: :unprocessable_entity 
        end
    
    end

    private
    def usuario_params
        params.permit(:correo, :password, :username, :rut, :sexo, :telefono, :curso, :rol_id)
    end


end
