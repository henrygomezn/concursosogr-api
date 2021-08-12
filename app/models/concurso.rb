class Concurso < ApplicationRecord
   has_many:votos, dependent: :destroy
   has_many:competidors, dependent: :destroy
end
