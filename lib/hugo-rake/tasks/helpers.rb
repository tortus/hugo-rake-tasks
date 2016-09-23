module HugoRake
  module Tasks
    module Helpers

      # Get the current git branch
      def self.current_branch
        `git rev-parse --abbrev-ref HEAD`.strip
      end


      # Get current git status as Array of Strings
      def self.git_statuses
        `git status --porcelain`.split(/\n/).map(&:strip)
      end

    end
  end
end
