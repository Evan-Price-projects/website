#require 'bcrypt's
class User < ActiveRecord::Base
  belongs_to :description
  #include BCrypt
  has_secure_password
  validates :name, presence: true, length: {maximum: 50, minimum: 1}
  validates :password_digest, presence: true

  #  def user_params
  #  params.require(:user).permit(:name, :password).merge(session_id: SecureRandom.base64)
  #end

  def self.create_user!(params)

    puts("this is pass #{Digest::SHA2.hexdigest(params[:user][:password_digest])}")
    #puts ("before #{params[:user][:password]}")
    #puts("password #{Digest::SHA2.hexdigest(params[:user][:password])}")
    #User.create!(params.require(:user).permit(:name, Digest::SHA2.hexdigest(:password_digest.to_s)).merge(session_token: SecureRandom.base64))
    #User.create!(params.require(:user).permit(:name, :password).merge(session_token: SecureRandom.base64))
    User.create(tablename: params[:user][:tablename], name: params[:user][:name], password_digest: Digest::SHA2.hexdigest(params[:user][:password_digest]), session_token: SecureRandom.base64)
  end
end