ActiveAdmin.register Schedule do
  menu id: "schedules", label: "Schedules", priority: 15
  actions :all, except: :show

  config.sort_order = :time

  permit_params :title, :speaker_id, :time

  index do
    selectable_column
    column :title
    column :speaker
    column :time do |schedule|
      schedule.time.strftime('%H:%M')
    end
    column :updated_at
    actions
  end

  filter :title
  filter :speaker

  form :html => { :multipart => true } do |f|
    f.semantic_errors
    f.inputs "Schedule" do
      f.input :title
      f.input :speaker
      f.input :time, label: "Starting Time"
    end
    f.actions
  end
end
