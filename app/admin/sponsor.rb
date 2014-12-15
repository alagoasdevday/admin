ActiveAdmin.register Sponsor do
  menu id: "sponsor", label: "Sponsors", parent: 'sponsor', priority: 10

  permit_params :name, :image, :sponsor_category_id

  index do
    selectable_column
    column :name
    column :sponsor_category
    column :updated_at
    actions
  end

  filter :name
  filter :sponsor_category

  form do |f|
    f.semantic_errors
    f.inputs "Sponsor" do
      f.input :name
      f.input :image
      f.input :sponsor_category
    end
    f.actions
  end
end
