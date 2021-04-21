class MedicineSerializer < ActiveModel::Serializer
  attributes :id,:name,:side_effects
  attribute :doses, if: ->{ should_render_association }

  def doses
    object.doses.map do |dose|
      ::DoseSerializer.new(dose).attributes
    end
  end

  def should_render_association
    @instance_options[:show_children]
  end
end
