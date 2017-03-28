require "stinger/version"

module Stinger
  def self.spacify(str, *strs)
    strs.each { |s| str += (" " + s) }
    return str
  end
end
