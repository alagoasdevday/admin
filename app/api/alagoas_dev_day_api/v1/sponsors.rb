class AlagoasDevDayApi::V1::Sponsors < Grape::API
  resource :sponsors do
    desc "Return all sponsors grouped by category", {
      notes: <<-NOTE
      Example:
      --------
      Default:

          http GET http://admin.alagoasdevday.com.br/api/v1/sponsors.json

      Response:

          [
            {
              "id": 1,
              "name": "Platinum",
              "sponsors": [
                {
                  "id": 1,
                  "name": "Sponsor Name",
                  "images": {
                    "original": "http://admin.alagoasdevday.com.br/system/uploads/sponsor/image/1/image.jpg"
                  }
                },
                {
                  "id": 2,
                  "name": "Sponsor Name",
                  "images": {
                    "original": "http://admin.alagoasdevday.com.br/system/uploads/sponsor/image/2/image.jpg"
                  }
                }
              ]
            },
            {
              "id": 2,
              "name": "Gold",
              "sponsors": [
                {
                  "id": 3,
                  "name": "Sponsor Name",
                  "images": {
                    "original": "http://admin.alagoasdevday.com.br/system/uploads/sponsor/image/3/image.jpg"
                  }
                }
              ]
            }
          ]
      NOTE
    }
    get do
       present SponsorCategory.all, with: AlagoasDevDayApi::V1::Entities::SponsorCategoryEntity
    end

    desc "Return all sponsors from a category", {
      notes: <<-NOTE
      Example:
      --------
      Default:

          http GET http://admin.alagoasdevday.com.br/api/v1/sponsors/1.json

      Response:

          [
            {
              "id": 1,
              "name": "Sponsor Name",
              "images": {
                "original": "http://admin.alagoasdevday.com.br/system/uploads/sponsor/image/1/image.jpg"
              }
            },
            {
              "id": 2,
              "name": "Sponsor Name",
              "images": {
                "original": "http://admin.alagoasdevday.com.br/system/uploads/sponsor/image/2/image.jpg"
              }
            }
          ]
      NOTE
    }
    params do
      requires :id, type: Integer, desc: "Sponsor Category ID"
    end
    get ':id', http_codes: [
      [200, "Ok"],
      [404, "Not Found"]
    ] do
      sponsor_category = SponsorCategory.find(params[:id])
      error!('Not Found', 404) if sponsor_category.nil?
      present sponsor_category.sponsors.all, with: AlagoasDevDayApi::V1::Entities::SponsorEntity
    end
  end
end
