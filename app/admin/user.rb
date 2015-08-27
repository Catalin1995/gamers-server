ActiveAdmin.register User do
  permit_params :username, :email, :password, :password_confirmation, :admin, :avatar, :remote_avatar_url

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :admin
    column :avatar
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :remote_avatar_url
      f.input :avatar
      f.input :admin
    end
    f.actions
  end
end
