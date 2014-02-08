class TabManager
    @@items = {}
    @@var_name = {}
    def self.add(id, item)
        @@items[id] ||= []
        @@items[id] << item
    end

    def self.get
        ret = []
        @@items.each do |id, item|
            item = true if item.nil?
            if item.is_a?(Hash)
                var = eval(item[:var]) == item[:expect_value].to_s
            else
                var = item
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
