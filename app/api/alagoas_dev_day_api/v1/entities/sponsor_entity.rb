module AlagoasDevDayApi::V1::Entities
  class SponsorEntity < Grape::Entity
    root 'sponsors', 'sponsor'
    expose :id, documentation: { type: 'integer', desc: 'ID' }
    expose :name, documentation: { type: 'string', desc: 'Sponsor Name' }
    expose :url, documentation: { type: 'string', desc: 'Sponsor URL' }
    expose :images do
      expose :original, documentation: { type: 'url', desc: 'Image URL - Original Size' } { |model, options| model.image.url }
    end
  end
end
