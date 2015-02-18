ActiveAdmin.register Sponsor do
  menu id: "sponsor", label: "Sponsors", parent: 'sponsor', priority: 10
  actions :all, except: :show
  includes :sponsor_category

  permit_params :name, :url, :image, :sponsor_category_id

  scope :all, default: true
  SponsorCategory.all.each do |category|
    scope(category.name) { |scope| scope.where(sponsor_category: category) }
  end

  index do
    selectable_column
    column :name
    column :url
    column :sponsor_category
    column :updated_at
    actions
  end

  filter :name

  form :html => { :multipart => true } do |f|
    f.semantic_errors
    f.inputs "Sponsor" do
      f.input :name
      f.input :url, label: "URL"
      f.input :image
      f.input :sponsor_category
    end
    f.actions
  end
end
