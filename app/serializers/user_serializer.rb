class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:mobile_number
  attribute :addresses, if: ->{ should_render_address }
  attribute :cards, if: ->{ should_render_card }

  def addresses
    object.addresses.map do |address|
      ::AddressSerializer.new(address).attributes
    end
  end

  def cards
    #object.cards.map do |card|
     # ::CardSerializer.new(card).attributes
    #end
    s1="XXXXXXXXXXXX"
    object.cards.map do |card|
      s=card.card_number
      card.card_number=s1 + s[-4..-1]
    end
      object.cards.map do |card|
         ::CardSerializer.new(card).attributes
       end
    
  end

  def should_render_address
    @instance_options[:show_address]
  end

  def should_render_card
    @instance_options[:show_card]
  end
end
