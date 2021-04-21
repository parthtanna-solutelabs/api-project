class DiseaseSerializer < ActiveModel::Serializer
  attributes :id,:disease_type
  attribute :medical_conditions, if: ->{ should_render_association }

  def medical_conditions
    object.medical_conditions.map do |medical_condition|
      ::MedicalConditionSerializer.new(medical_condition).attributes
    end
  end
  
  def should_render_association
    @instance_options[:show_children]
  end

  
end
