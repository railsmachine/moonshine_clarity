module Clarity

  # Define options for this plugin via the <tt>configure</tt> method
  # in your application manifest:
  #
  #   configure(:clarity => {:foo => true})
  #
  # Then include the plugin and call the recipe(s) you need:
  #
  #  plugin :clarity
  #  recipe :clarity
  def clarity(options = {})
    package :clarity, :provider => :gem, :ensure => :installed

    file '/etc/god/clarity.god', 
      :content => template(File.join(File.dirname(__FILE__), '..', 'templates', 'clarity.god.erb'), binding),
      :mode => '644',
      :notify => exec('restart_god')
  end
  
end
