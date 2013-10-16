# encoding : utf-8

require 'iconv'

class Lang
	attr_accessor :locale

	def initialize(lang = :kr)
		@locale = lang
		@table = Hash.new
	end

	def load(lang, path)
		if @table[lang] == nil
			@table[lang] = Hash.new
		end

		fp = File.new(path, "r:cp949")
		buf = fp.read()

		iconv = Iconv.new("utf-8", buf.encoding.to_s)

		buf.each_line do |line|
			data = line.match(/(?<name>[a-zA-Z0-9_]+)(\s*=\s*(?<value>.+))/)

			if data != nil
				@table[lang][data["name"].to_sym] = iconv.conv(data["value"])
			end
		end

		iconv.close
		fp.close
	end

	def get(name, *args)
		if @table[@locale][name] == nil
			"no value"
		else
			@table[@locale][name] % args
		end
	end
end
