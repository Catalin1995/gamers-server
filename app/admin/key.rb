ActiveAdmin.register Key do
  permit_params :id, :user_id

  index do
    selectable_column
    id_column
    column :user_id
    column :consumer_key
    column :secret_key
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :user
    end
    f.actions
  end
end
