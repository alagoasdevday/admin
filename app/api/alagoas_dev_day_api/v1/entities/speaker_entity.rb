module AlagoasDevDayApi::V1::Entities
  class SpeakerEntity < Grape::Entity
    root 'speakers', 'speaker'
    expose :id, documentation: { type: 'integer', desc: 'ID' }
    expose :name, documentation: { type: 'string', desc: 'Speaker Name' }
    expose :bio, documentation: { type: 'string', desc: 'Speaker Bio' }
    expose :company_name, documentation: { type: 'string', desc: 'Speaker Company Name' }
    expose :theme, documentation: { type: 'string', desc: 'Lecture Theme' }
    expose :time, documentation: { type: 'string', desc: 'Lecture Time' } { |model, options| model.time.strftime('%H:%M') }
    expose :confirmed, documentation: { type: 'boolean', desc: 'If Speaker is confirmed' }
    expose :twitter_url, documentation: { type: 'url', desc: 'Speaker Twitter URL' }
    expose :facebook_url, documentation: { type: 'url', desc: 'Speaker Facebook URL' }
    expose :github_url, documentation: { type: 'url', desc: 'Speaker Github URL' }
    expose :linkedin_url, documentation: { type: 'url', desc: 'Speaker LinkedIn URL' }
    expose :speakerdeck_url, documentation: { type: 'url', desc: 'Speaker Speakerdeck URL' }
    expose :video_url, documentation: { type: 'url', desc: 'Speaker Video URL' }
    expose :images do
      expose :company do
        expose :original, documentation: { type: 'url', desc: 'Company Image URL - Original Size' } { |model, options| model.company_image.url }
      end
      expose :speaker do
        expose :original, documentation: { type: 'url', desc: 'Speaker Image URL - Original Size' } { |model, options| model.speaker_image.url }
      end
    end
  end
end
