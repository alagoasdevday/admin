ActiveAdmin.register SponsorCategory do
  menu id: "sponsor_categories", label: "Categories", priority: 20, parent: "sponsor"
  actions :all, except: :show

  permit_params :name

  sortable
  config.sort_order = :position
  config.paginate   = false

  index do
    sortable_handle_column
    selectable_column
    column :name, :sortable => false
    column :sponsors do |category|
      category.sponsors.size
    end
    column :updated_at, :sortable => false
    actions
  end

  filter :name

  form do |f|
    f.semantic_errors
    f.inputs "Sponsor Category" do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
    end
  end
end
