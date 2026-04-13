class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :category, presence: true
  validates :region, presence: true
  validates :occasion, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, on: :create

  enum :category, {
    entrada: 'entrada',
    prato_principal: 'prato_principal',
    sobremesa: 'sobremesa',
    bebida: 'bebida',
    acompanhamento: 'acompanhamento'
  }, prefix: true

  enum :region, {
    norte: 'norte',
    nordeste: 'nordeste',
    centro_oeste: 'centro_oeste',
    sudeste: 'sudeste',
    sul: 'sul',
    geral: 'geral'
  }, prefix: true

  enum :occasion, {
    natal: 'natal',
    pascoa: 'pascoa',
    festa_junina: 'festa_junina',
    dia_dos_pais: 'dia_dos_pais',
    dia_das_maes: 'dia_das_maes',
    aniversario: 'aniversario',
    dia_a_dia: 'dia_a_dia'
  }, prefix: true

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.parameterize if title.present?
  end
end
