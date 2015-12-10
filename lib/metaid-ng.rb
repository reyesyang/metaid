# metaid
# ------
# a new simple singleton_class helpers

class Object
  # The hidden singleton lurks behind everyone
  #
  # def singleton_class
  #   class << self
  #     self
  #   end
  # end

  def singleton_eval &blk
    singleton_class.instance_eval &blk
  end

  # Adds methods to a singleton_class
  def singleton_def name, &blk
    singleton_eval { define_method name, &blk }
  end
end

class Module
  # Defines an instance method within a module
  def module_def name, &blk
    module_eval { define_method name, &blk }
  end
end

class Class
  alias class_def module_def
end
