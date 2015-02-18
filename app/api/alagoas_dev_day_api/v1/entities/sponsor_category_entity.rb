module AlagoasDevDayApi::V1::Entities
  class SponsorCategoryEntity < Grape::Entity
    root 'sponsor_categories', 'sponsor_category'
    expose :id, documentation: { type: 'integer', desc: 'ID' }
    expose :name, documentation: { type: 'string', desc: 'Category Name' }
    expose :sponsors, using: AlagoasDevDayApi::V1::Entities::SponsorEntity
  end
end
