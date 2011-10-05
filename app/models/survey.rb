class Survey < ActiveRecord::Base
  validates_presence_of :destino, :objeto, :valor
  
  #attr_accessible :destino, :objeto, :valor
end
