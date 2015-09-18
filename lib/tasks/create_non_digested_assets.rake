# Every time assets:precompile is called, trigger assets:create_non_digested_assets.

Rake::Task["assets:precompile"].enhance do  
  Rake::Task["assets:create_non_digested_assets"].invoke
end

namespace :assets do

  logger = Logger.new($stderr)

  task :create_non_digested_assets => :"assets:environment"  do
    manifest_path = Dir.glob(File.join(Rails.root, 'public/assets/manifest-*.json')).first
    manifest_data = JSON.load(File.new(manifest_path))

    manifest_data["assets"].each do |logical_path, digested_path|
      logical_pathname = Pathname.new logical_path

      if Rails.application.config.assets.non_digested_assets.any? {|pattern| logical_pathname.fnmatch?(pattern, File::FNM_PATHNAME) }
        full_digested_path    = File.join(Rails.root, 'public/assets', digested_path)
        full_nondigested_path = File.join(Rails.root, 'public/assets', logical_path)

        logger.info "Copying to #{full_nondigested_path}"

        # Use FileUtils.copy_file with true third argument to copy
        # file attributes (eg mtime) too, as opposed to FileUtils.cp
        FileUtils.copy_file full_digested_path, full_nondigested_path, true
      end
    end
  end
end  