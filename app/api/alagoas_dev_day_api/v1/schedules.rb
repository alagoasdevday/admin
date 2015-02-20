class AlagoasDevDayApi::V1::Schedules < Grape::API
  resource :schedules do
    desc "Return all schedules", {
      notes: <<-NOTE
      Example:
      --------
      Default:

          http GET http://admin.alagoasdevday.com.br/api/v1/speakers.json

      Response:

          [
            {
              "id": 1,
              "name": "Schedule Title",
              "time": "08:00",
              "speaker": NULL
            },
            {
              "id": 1,
              "name": "Schedule Title",
              "time": "09:00",
              "speaker": {
                "id": 1,
                "name": "Speaker Name",
                "bio": "Speaker Bio",
                "company_name": "Speaker Company Name",
                "theme": "Speaker Theme",
                "confirmed": false,
                "twitter_url": "http://twitter.com/aldevday",
                "facebook_url": "https://www.facebook.com/devdayalagoas",
                "github_url: "http://github.com/alagoasdevday",
                "linkedin_url": "https://www.linkedin.com/in/devdayalagoas",
                "speakerdeck_url": "https://speakerdeck.com",
                "video_url": "https://www.youtube.com/watch?v=rylyfI2PLzE",
                "images": {
                  "company": {
                    "original": "http://admin.alagoasdevday.com.br/system/uploads/speaker/company_image/1/image.jpg"
                  },
                  "speaker": {
                    "original": "http://admin.alagoasdevday.com.br/system/uploads/speaker/speaker_image/1/image.jpg"
                  }
                }
              }
            }
          ]
      NOTE
    }
    get do
      cache(key: "api:schedules:all", expires: 1.day) do
        present Schedule.all, with: AlagoasDevDayApi::V1::Entities::ScheduleEntity
      end
    end
  end
end
