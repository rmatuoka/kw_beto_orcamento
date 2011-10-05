class UserMailer < ActionMailer::Base
  default :from => "Pesquisa Respondida - Beto Tricoli  <noreply@betotricoli.com>"
  
  def resposta(survey)
    @survey = survey
    mail(:to => "rmatuoka@korewa.com.br", :subject => "Pesquisa Orçamento 2011")
    #mail(:to => "betotricoli@al.sp.gov.br", :bbc => "rmatuoka@korewa.com.br, betrix43@hotmail.com",  :subject => "Pesquisa Orçamento 2011")
  end
end
