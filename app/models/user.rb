class User < ActiveRecord::Base
  include ActiveModel::Validations
  
  CARREERS = ['INFORMATICA', 'MECANICA', 'PLAN COMUN', 'CIVIL', 'QUIMICA', 'ELECTRICA'] # FIXME: Are all carreers here?
  
  validates :uid, :email, :presence => true
  validates :name, :last_name, :rol, :rut, :carreer, :presence => true, :on => :update
  validates :registered, :inclusion => { :in => [true, false] }
  validates :carreer, :inclusion => { :in => CARREERS }, :on => :update
  
  validates :rut, :rol, :rut => true
  
  before_save -> { self.rut.try(:gsub!, /\./, '') }
  before_save -> { self.rol.try(:gsub!, /\./, '') }
  
  has_many :ballots
  
  def self.create_or_find_by_hash(hash)
    unless user = find_by_uid(hash['uid'])
      # Create the user
      create! :uid => hash['uid'], 
              :email => hash['user_info']['email'], 
              :name => hash['user_info']['first_name'].upcase,
              :last_name => hash['user_info']['last_name'].upcase
    else
      user # Return the user
    end
  end
  
  def full_name
    "#{self.name} #{self.last_name}"
  end
end
