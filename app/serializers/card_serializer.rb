class CardSerializer < ActiveModel::Serializer
  attributes :id,:card_number

  def attributes
    hash=super
    d=object.expiry_date.to_s
    d=Time.parse(d).to_s
    arr=d.split('-')
    hash['expiry_date'] = "#{arr[1]}/#{arr[0][-2..-1]}"
    hash
  end
end
