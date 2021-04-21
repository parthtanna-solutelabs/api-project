class MedicalConditionSerializer < ActiveModel::Serializer
  attributes :id,:name
  attribute :medicines, if: ->{ should_render_association }

  def medicines
    object.medicines.map do |medicine|
      ::MedicineSerializer.new(medicine).attributes
    end
  end

  def should_render_association
    @instance_options[:show_children]
  end
end
