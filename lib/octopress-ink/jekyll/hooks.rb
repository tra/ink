module Octopress
  module Ink
    class SiteHook < Hooks::Site

      def post_read(site)
        Octopress.site = site
        Ink::Plugins.register
        Ink::Plugins.add_files
      end

      def merge_payload(payload, site)
        Ink.payload
      end

      def post_write(site)
        Octopress::Ink::Plugins.static_files.each do |f| 
          f.write(site.dest)
        end
      end
    end
  end
end

