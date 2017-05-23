class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pastry
  validates :status, presence: true, inclusion: { in: ["En attente de validation", "validée"],
  message: "%{value} n'est pas un statut valide pour une commande" }
end
