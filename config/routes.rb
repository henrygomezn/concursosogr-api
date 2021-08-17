Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :usuarios
      resources :competidor
      resources :concurso
      resources :voto
      resources :notice
      resources :contacto
      get 'actual', to: 'usuarios#actual'
      post 'login', to: 'session#login'
      post 'ultimosCompetidores', to: 'competidor#ultimosCompetidores'
      post 'misParticipaciones', to: 'competidor#misParticipaciones'
      post 'mostrarFicha', to: 'competidor#mostrarFicha'
      post 'contadorVotos', to: 'competidor#contadorVotos'
      post 'eliminarCuento', to: 'competidor#eliminarCuento'
      post 'buscarxId', to: 'competidor#buscarxId'
      post 'buscarxTitulo', to: 'competidor#buscarxTitulo'
      post 'verificarVoto', to: 'voto#verificarVoto'
      post 'showIMG', to: 'competidor#showIMG'
      get 'ultimasNoticias', to: 'notice#ultimasNoticias'
      get 'masVotados', to: 'competidor#masVotados'
      get 'dashboard', to: 'atajos#dashboard'
      post 'eliminarUsuario', to: 'usuarios#eliminarUsuario'
      post 'eliminarConcurso', to: 'concurso#eliminarConcurso'
      post 'eliminarNoticia', to: 'notice#eliminarNoticia'
    end
  end
end
