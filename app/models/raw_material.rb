class RawMaterial < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }



  def update_quantity(quantity)
    self.quantity += quantity
  end

  # @material1 = RawMaterial.find_by_name('Aço')
  # @material2 = RawMaterial.find_by_name('Rosca')
  # @material3 = RawMaterial.find_by_name('Ferro')
  # @material4 = RawMaterial.find_by_name('Parafuso')

  def self.get_opgw_box_bm
    return {
      aco: 1,
      rosca: 5,
      ferro: 2,
      parafuso: 3
    }
  end
  
end
