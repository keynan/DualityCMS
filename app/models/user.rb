class User < ActiveRecord::Base
  acts_as_authentic do |c|
		c.session_class = UserSession
	end

#### OLD cms stuff

	def full_name
		[ first_name.humanize, last_name.humanize ].join(' ')
	end
	
	
=begin

	validates_presence_of :name, :password, :first_name, :last_name, :email
	validates_uniqueness_of :name, :email
	validates_confirmation_of :password, :on => :save
	validates_format_of :email, :with => /^[A-Za-z0-9_\-\.]+@[A-Za-z_\-\.]+\.(ca|com|net|org|info|us)$/#/^[A-Za-z0-9_\-\.]+@[A-Za-z0-9_\-\.]+\.(com|ca|net|org|info|us)$/
	
	before_save :encrypt_password
	after_create :give_settings
	after_save :clear_password_fields
	
	before_destroy :do_not_delete_keynan
	
	attr_accessor :password_confirmation
	
	has_and_belongs_to_many :roles,			:order => 'roles.name', :include => [:privleges]
#	has_and_belongs_to_many :privleges, :order => 'name', :uniq => true, :through => :roles
	
	has_one :settings, :class_name => 'UserSetting', :foreign_key => 'id', :dependent => :destroy
	
	def self.root_user
		find_by_name('keynan')
	end
	
	def privleges
		privs = []
		roles.each{|role| privs += role.privleges }
		privs.uniq
	end
	
	def has_privlege?(priv)
		privleges.include?(Privlege.new(:name => priv.to_s))
	end

	def has_privleges?(privs = [])
		result = true
		privs.each do |priv|
			result &= has_privlege(priv)
			break unless result
		end
	end

	def encrypt_password
		self.password = User.encrypt(self.password)
	end
	
	#do save save
	
	def give_settings
		#create a settings entry for the new user
		self.reload
		settings = UserSetting.new
		settings.id = self.id
		settings.save
	end
	
	def clear_password_fields
		#clear the password
		password = nil
		password_confirmation = nil
	end
	
	def do_not_delete_keynan
		if (self.name == 'keynan')
			raise "Can't destroy the super user!"
		end
	end
	
	def has_role?(role)
		roles.include?Role.new(:name => role.to_s)
	end
	
	def self.login(name, password)
		password = User.encrypt(password)
		return find_by_name_and_password(name, password)
	end

	def try_to_login
		User.login(self.name, self.password)
	end
	
	def ==(user)
		user and user.name == self.name
	end
	
	private
	def self.encrypt(password)
		Digest::SHA1.hexdigest(password)
	end

=end

end
