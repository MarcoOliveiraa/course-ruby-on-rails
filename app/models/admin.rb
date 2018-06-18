class Admin < ApplicationRecord
  enum role: [:full_access, :restricted_access]

  scope :with_full_access, -> {where(role: 0)}
  scope :with_restricted_access, -> {where(role: 1)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def role_checked
    if role == 'full_access'
      true
    else
      false
    end
  end

  def role_translation
    if role == 'full_access'
      'Acesso total'
    else
      'Acesso restrito'
    end
  end
end
