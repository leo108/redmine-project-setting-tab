class TabManager
	@@items = {}
	@@var_name = {}
	def self.add(id, item)
		@@items[id] ||= []
		@@items[id] << item
	end

	def self.get
		ret = []
		@@items.each do |id, items|
			@@var_name[id] = true if @@var_name[id].nil?
			if @@var_name[id].is_a?(Hash)
				var = eval(@@var_name[id][:var]) == @@var_name[id][:expect_value].to_s
			else
				var = @@var_name[id]
			end
			if var
				ret = ret.concat(@@items[id])
			end
		end
		ret
	end

	def self.set_var(id, var_name)
		@@var_name[id] = var_name
	end
end
