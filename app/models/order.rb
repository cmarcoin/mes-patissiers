class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pastry
  has_one :review, dependent: :destroy
  validates :status, presence: true, inclusion: { in: ["En attente de validation", "validée"],
  message: "%{value} n'est pas un statut valide pour une commande" }
  validates :delivery_date, presence: true
  validates :quantity, presence: true

  def validate
    self.status = "validée"
  end
end
