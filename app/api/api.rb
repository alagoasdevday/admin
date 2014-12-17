class API < Grape::API
  rescue_from :all, :backtrace => true

  format :json

  mount AlagoasDevDayApi::V1::Base
end
