ActiveAdmin.register Speaker do
  menu id: "speakers", label: "Speakers", priority: 10
  actions :all, except: :show

  config.sort_order = :time
  permit_params :name, :company_image, :speaker_image, :theme, :twitter_url, :facebook_url, :github_url, :linkedin_url, :speakerdeck_url, :video_url, :confirmed, :bio, :company_name

  scope :all, default: true
  scope :confirmed
  scope :unconfirmed

  index do
    selectable_column
    column :image do |speaker|
      image_tag speaker.speaker_image.admin_thumb.url
    end
    column :name
    column :theme
    column :confirmed do |speaker|
      link_to confirm_admin_speaker_path(speaker), method: :post do
        # status_tag()
        "<span class=\"status_tag #{speaker.confirmed ? "yes" : "no"}\">#{speaker.confirmed ? "Yes" : "No"}</span>".html_safe
      end
    end
    column :updated_at
    actions
  end

  filter :name
  filter :theme

  form :html => { :multipart => true } do |f|
    f.semantic_errors
    f.inputs "Speaker Information" do
      f.input :name
      f.input :bio
      f.input :company_name
    end
    f.inputs "Images" do
      f.input :company_image, :hint => f.object.company_image_identifier
      f.input :speaker_image, :hint => f.object.speaker_image_identifier
    end
    f.inputs "Social Networks" do
      f.input :twitter_url, label: "Twitter URL"
      f.input :facebook_url, label: "Facebook URL"
      f.input :github_url, label: "Github URL"
      f.input :linkedin_url, label: "LinkedIn URL"
      f.input :speakerdeck_url, label: "Speakerdeck URL"
      f.input :video_url, label: "Video URL"
    end
    f.inputs "Lecture Information" do
      f.input :theme
    end
    f.actions
  end

  member_action :confirm, method: :post do
    resource.confirmed = !resource.confirmed
    resource.save
    redirect_to admin_speakers_path, notice: "#{resource.name} is #{resource.confirmed ? "confirmed" : "NOT confirmed"} as speaker of this event!"
  end
end
