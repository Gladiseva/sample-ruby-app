# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :todos, foreign_key: :created_by

  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates_presence_of :email
end
