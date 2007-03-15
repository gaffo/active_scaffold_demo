class UsersController < DemoController

  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  end

  active_scaffold :user do |config|
    config.columns = [:id, :name, :first_name, :middle_name, :last_name, :phone_number, :email_address, :login, :password, :location, :roles, :aliases]
    config.columns[:location].ui_type = :select
    config.columns[:phone_number].description = "(Format: ###-###-####)"
    config.columns[:phone_number].label = "Phone"
    
    config.create.columns.exclude :id, :name
    config.list.columns.exclude :first_name, :middle_name, :last_name
    config.list.sorting = {:login => 'ASC'}
    config.update.columns.exclude :id, :name
    
    config.nested.add_link "Names", [:aliases]
  end

end
