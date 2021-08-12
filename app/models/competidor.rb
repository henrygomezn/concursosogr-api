class Competidor < ApplicationRecord
  belongs_to :usuario
  belongs_to :concurso
  has_many:votos, dependent: :destroy
  validates :titulo, presence: true, uniqueness: true
  validates :autor, presence: true
  validates :descripcion, presence: true
  has_one_attached :cover_picture
  has_one_attached :cover_pdf
end
