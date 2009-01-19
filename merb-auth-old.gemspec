GEM_NAME = "ateam-merb-auth-old"
GEM_VERSION = "0.0.1"

Gem::Specification.new do |s| 
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.author = "ateam"
  s.email = "ateam.web@gmail.com"
  s.homepage = "http://a-team.lt"
  s.platform = Gem::Platform::RUBY
  s.summary = "Merb authentication gem"
  s.files = [
    "app/views/users/new.html.erb",
    "app/views/layout/merb_auth.html.erb",
    "app/views/sessions/new.html.erb",
    "app/mailers/views/user_mailer/activation.text.erb",
    "app/mailers/views/user_mailer/signup.text.erb",
    "app/mailers/views/user_mailer/forgot_password.text.erb",
    "app/mailers/user_mailer.rb",
    "app/controllers/sessions.rb",
    "app/controllers/users.rb",
    "app/controllers/application.rb",
    "app/helpers/application_helper.rb",
    "lib/merb-auth/initializer.rb",
    "lib/merb-auth/slicetasks.rb",
    "lib/merb-auth/adapters/activerecord/model.rb",
    "lib/merb-auth/adapters/activerecord/map.rb",
    "lib/merb-auth/adapters/activerecord/init.rb",
    "lib/merb-auth/adapters/common.rb",
    "lib/merb-auth/adapters/map.rb",
    "lib/merb-auth/adapters/sequel/model.rb",
    "lib/merb-auth/adapters/sequel/map.rb",
    "lib/merb-auth/adapters/sequel/init.rb",
    "lib/merb-auth/adapters/datamapper/model.rb",
    "lib/merb-auth/adapters/datamapper/map.rb",
    "lib/merb-auth/adapters/datamapper/init.rb",
    "lib/merb-auth/controller/users_base.rb",
    "lib/merb-auth/controller/sessions_base.rb",
    "lib/merb-auth/controller/controller.rb",
    "lib/merb-auth/merbtasks.rb",
    "lib/merb-auth.rb",
    "lib/ateam-merb-auth-old.rb",
    "TODO",
    "spec/spec_helpers/valid_model_hashes.rb",
    "spec/spec_helpers/helpers.rb",
    "spec/spec_helper.rb",
    "spec/mailers/user_mailer_spec.rb",
    "spec/controllers/users_spec.rb",
    "spec/controllers/plugins/test_plugin.rb",
    "spec/controllers/sessions_spec.rb",
    "spec/models/sq_model_spec.rb",
    "spec/models/ar_model_spec.rb",
    "spec/models/common_spec.rb",
    "spec/models/model_spec.rb",
    "spec/merb_auth_spec.rb",
    "spec/shared_specs/shared_model_spec.rb",
    "LICENSE",
    "Rakefile",
    "stubs/app/views/users/new.html.erb",
    "stubs/app/views/sessions/new.html.erb",
    "stubs/app/mailers/views/activation.text.erb",
    "stubs/app/mailers/views/signup.text.erb",
    "stubs/app/controllers/main.rb",
    "stubs/app/controllers/application.rb",
    "README",
    "datamapper_generators/ma_migration/ma_migration_generator.rb",
    "datamapper_generators/ma_migration/templates/schema/migrations/add_ma_user.rb",
    "public/stylesheets/master.css",
    "public/javascripts/master.js",
    "activerecord_generators/ma_migration/ma_migration_generator.rb",
    "activerecord_generators/ma_migration/templates/schema/migrations/%time_stamp%_add_ma_user.rb",
    "plugins/forgotten_password/app/views/passwords/edit.html.erb",
    "plugins/forgotten_password/app/views/passwords/new.html.erb",
    "plugins/forgotten_password/app/controllers/passwords.rb",
    "plugins/forgotten_password/app/models/user.rb",
    "plugins/forgotten_password/spec/controller_spec.rb",
    "plugins/forgotten_password/spec/spec_helper.rb",
    "plugins/forgotten_password/spec/model_spec.rb",
    "plugins/forgotten_password/forgotten_password.rb",
    "plugins/forgotten_password/init.rb"
  ]
  s.require_path = "lib"
  s.autorequire = "name"
  s.test_files = [
  ]
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
end
