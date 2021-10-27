module Vendor
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    attr_accessor :vendor_name
  end
end
