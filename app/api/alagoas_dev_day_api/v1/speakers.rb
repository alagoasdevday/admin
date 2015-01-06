class AlagoasDevDayApi::V1::Speakers < Grape::API
  resource :speakers do
    desc "Return all speakers", {
      notes: <<-NOTE
      Example:
      --------
      Default:

          http GET http://admin.alagoasdevday.com.br/api/v1/speakers.json

      Response:

          [
            {
              "id": 1,
              "name": "Speaker Name",
              "theme": "Speaker Theme",
              "time": "09:00",
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
            },
            {
              "id": 2,
              "name": "Speaker Name",
              "theme": "Speaker Theme",
              "time": "10:00",
              "confirmed": true,
              "twitter_url": "http://twitter.com/aldevday",
              "facebook_url": "https://www.facebook.com/devdayalagoas",
              "github_url: "http://github.com/alagoasdevday",
              "linkedin_url": "https://www.linkedin.com/in/devdayalagoas",
              "speakerdeck_url": "https://speakerdeck.com",
              "video_url": "https://www.youtube.com/watch?v=rylyfI2PLzE",
              "images": {
                "company": {
                  "original": "http://admin.alagoasdevday.com.br/system/uploads/speaker/company_image/2/image.jpg"
                },
                "speaker": {
                  "original": "http://admin.alagoasdevday.com.br/system/uploads/speaker/speaker_image/2/image.jpg"
                }
              }
            }
          ]
      NOTE
    }
    get do
      cache(key: "api:speakers:all", expires: 1.day) do
        present Speaker.all, with: AlagoasDevDayApi::V1::Entities::SpeakerEntity
      end
    end
  end
end
