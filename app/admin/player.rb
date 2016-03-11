ActiveAdmin.register Player do
  permit_params :first_name, :last_name, :birthdate

  index do
    selectable_column
    id_column
    column :full_name
    column :current_age
    column :birthdate
    actions
  end

  filter :first_name
  filter :last_name
  filter :birthdate

  form do |f|
    f.inputs "Player Details" do
      f.input :first_name
      f.input :last_name
      f.input :current_age
      f.input :birthdate, :as => :datepicker
    end
    f.actions
  end

end
