# frozen_string_literal: true

namespace :vendor do
  directory "apps"

  task r10k: :apps do
    r10k_repo = File.expand_path("~/src/github.com/skipkayhil/r10k")

    Dir.chdir(r10k_repo) do
      sh "R10K_APPS='rails' rake build"

      license = File.read("MIT-LICENSE")

      Dir["apps/rails_*_10.rb"].each do |d|
        vendored_path = File.expand_path(d.gsub("rails", "r10k"), __dir__)

        File.open(vendored_path, "w") do |f|
          File.foreach(d) do |l|
            f << l

            next unless l.include?("frozen-string-literal")

            f << "\n"

            license.each_line do |ll|
              f << "# " << ll
            end
          end
        end

        puts "vendored: #{vendored_path}"
      end
    end
  end
end
