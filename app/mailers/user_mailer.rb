class MerbAuth::UserMailer < Merb::MailController
  
  controller_for_slice MerbAuth, :templates_for => :mailer, :path => "views"
  
  def signup
    @ivar = params[MA[:single_resource]]
    Merb.logger.info "Sending Signup to #{@ivar.email} with code #{@ivar.activation_code}"
    instance_variable_set("@#{MA[:single_resource]}", @ivar )
    render_utf8_mail :text => :signup, :layout => nil
  end
  
  def activation
    @ivar = params[MA[:single_resource]]
    Merb.logger.info "Sending Activation email to #{@ivar.email}"
    instance_variable_set("@#{MA[:single_resource]}", @ivar )
    render_utf8_mail :text => :activation, :layout => nil
  end
  
  def forgot_password
    @ivar = params[MA[:single_resource]]
    instance_variable_set("@#{MA[:single_resource]}", @ivar )
    render_utf8_mail :text => :forgot_password, :layout => nil
  end    

  private

  def render_utf8_mail(options)
    mail = render_mail options
    mail.text = Base64.encode64(unix2dos(mail.text))
    mail
  end

  def unix2dos(text)
    text.gsub(%r{\n$|\r\n$}, "\r\n")
  end

end
