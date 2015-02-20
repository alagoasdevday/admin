module AlagoasDevDayApi::V1::Entities
  class ScheduleEntity < Grape::Entity
    root 'schedules', 'schedule'
    expose :id, documentation: { type: 'integer', desc: 'ID' }
    expose :title, documentation: { type: 'string', desc: 'Title' }
    expose :time, documentation: { type: 'string', desc: 'Time' } { |model, options| model.time.strftime('%H:%M') }
    expose :speaker, using: AlagoasDevDayApi::V1::Entities::SpeakerEntity
  end
end
