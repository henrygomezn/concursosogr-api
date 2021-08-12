class ApplicationController < ActionController::API
  
    include ManejadorDeExcepciones
    include ActionController::MimeResponds

    
    rescue_from CanCan::AccessDenied do |exception|
        render json: { mensaje: exception.message }, status: 403
    end

    def current_user
        if token
            @usuario_actual ||= Usuario.find(token[:usuario_id])
        else
            @usuario_actual ||= Usuario.new(rol_id: 3)
        end
    end

    private
    def token
        valor = request.headers[:Authorization]
        return if valor.blank?
        @token ||= JsonWebToken.decode(valor.split(" ").last)
    end
end
