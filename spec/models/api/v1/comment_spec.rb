require 'rails_helper'

RSpec.describe Api::V1::Comment, type: :model do
  # Asegura que el modelo Api::V1::Comment esté correctamente configurado para las asociaciones
  describe "associations" do
    it { should belong_to(:blog) }
  end

  # Asegura que las validaciones del modelo Api::V1::Comment sean correctas
  describe "validations" do
    it { should validate_presence_of(:body) }
    # Aquí puedes agregar otras pruebas de validación, por ejemplo:
    # it { should validate_presence_of(:other_attribute) }
  end
end
