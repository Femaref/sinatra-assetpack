module Sinatra::AssetPack
  class HamlEngine < Engine
    def html(str, options={})
      cmd = "#{haml_bin} %f "

      _, input = sys :css, str, cmd
      output   = input.gsub(/\.haml/, '.html')

      File.read(output)
    rescue => e
      nil
    end
    
    def haml_bin
      ENV['HAML_PATH'] || "haml"
    end
  end

  Compressor.register :html, :haml, HamlEngine
end
