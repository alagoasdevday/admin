ActiveAdmin.register Speaker do
  permit_params :name, :company_image, :speaker_image, :theme, :twitter_url, :facebook_url, :linkedin_url, :speakerdeck_url, :video_url, :time, :confirmed

  scope :all
  scope :confirmed
  scope :unconfirmed

  index do
    selectable_column
    column :name
    column :theme
    column :time
    column :confirmed
    column :updated_at
    actions
  end

  filter :name
  filter :theme

  form :html => { :multipart => true } do |f|
    f.semantic_errors
    f.inputs "Speaker Information" do
      f.input :name
      f.input :confirmed
    end
    f.inputs "Images" do
      f.input :company_image, :hint => f.object.company_image_identifier
      f.input :speaker_image, :hint => f.object.speaker_image_identifier
    end
    f.inputs "Social Networks" do
      f.input :twitter_url, label: "Twitter URL"
      f.input :facebook_url, label: "Facebook URL"
      f.input :linkedin_url, label: "LinkedIn URL"
      f.input :speakerdeck_url, label: "Speakerdeck URL"
      f.input :video_url, label: "Video URL"
    end
    f.inputs "Lecture Information" do
      f.input :theme
      f.input :time, label: "Starting Time"
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
