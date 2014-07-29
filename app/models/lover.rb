class Lover < ActiveRecord::Base
  attr_reader :entered_password

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, sweetie!" }
  validates :entered_password, :length => { :minimum => 6, :message => "must be at least 6 characters, sweetie!" }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  has_many :notes
  has_many :comments



  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = Lover.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
