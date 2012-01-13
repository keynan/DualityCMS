# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

CmsSettings.create({:protected_directories => 'cms'})

root = User.create({:login => 'god', 
	:first_name => 'God', 
	:last_name => 'of ladles that stop the droar from opening', 
	:password => 'password',
	:password_confirmation => 'password',
	:email => 'keynan21@gmail.com'
	})

view_audit_trail_privilege = Privilege.create(:name => 'view_audit_trail')
edit_cms_settings_privilege = Privilege.create(:name => 'edit_cms_settings')
#_privilege = Privilege.create(:name => '')

admin_role = Role.create({:name => 'Admin'})
publisher_role = Role.create({:name => 'Publisher'})
editor_role = Role.create({:name => 'Editor'})
writer_role = Role.create({:name => 'Writer'})
