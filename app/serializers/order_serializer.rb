class OrderSerializer < ActiveModel::Serializer
  attributes :id,:order_details,:card
  
  
  
  def order_details
    s1="XXXXXXXXXXXX"
    medicine = Medicine.find(object.medicine_id)
    dose = Dose.find(object.dose_id)
    pack = Pack.find(object.pack_id)
    payment_method = object.payment_method
    card = Card.find(object.card_id)
    address = Address.find(object.address_id)
    return {medicine:medicine.name, dose:dose.weight, pack_size:pack.size, price:pack.price, address:address.address}

  end
  def card
    s1="XXXXXXXXXXXX"
    card = Card.find(object.card_id)
    if card.user_id != 1
      return {card_number:s1 + card.card_number[-4..-1]}
    else
      return {card_number:"--"}
    end
  end

end
