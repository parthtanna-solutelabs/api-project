class DoseSerializer < ActiveModel::Serializer
  attributes :id,:weight
  attribute :packs, if: ->{ should_render_association }

  def packs
    object.packs.map do |pack|
      ::PackSerializer.new(pack).attributes
    end
  end

  def should_render_association
    @instance_options[:show_children]
  end
end
