module AlagoasDevDayApi
  module V1
    class Base < Grape::API

      prefix 'api'
      version 'v1', using: :path

      mount Speakers
      mount Sponsors
    end
  end

end
