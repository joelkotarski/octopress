module Octopress
  class Theme
    def self.theme_unpack_opts(command)
      Octopress.logger.debug("Unpacking theme options...")
      self.subclasses.each do |s|
        s.theme_unpack_opts(command)
      end
    end

    def self.install
      Octopress.logger.debug("Beginning install process...")
      self.subclasses.each do |s|
        s.install
      end
    end

    # Install a hook so that subclasses are recorded. This method is only
    # ever called by Ruby itself.
    #
    # base - The Class subclass.
    #
    # Returns nothing.
    def self.inherited(base)
      subclasses << base
    end

    # The list of Classes that have been subclassed.
    #
    # Returns an Array of Class objects.
    def self.subclasses
      @subclasses ||= []
    end
  end
end
