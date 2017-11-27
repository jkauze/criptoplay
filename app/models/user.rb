class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_save :set_monto_saldo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bets 



  private

  def set_monto_saldo

  	self.monto ||= 0
  	self.saldo ||= 0
  end

end
