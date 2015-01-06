class API < Grape::API
  rescue_from :all, :backtrace => true

  format :json

  include Grape::Rails::Cache

  mount AlagoasDevDayApi::V1::Base
end
