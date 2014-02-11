class TabManager
    @@items = {}
    @@expr = {}
    def self.add(id, item)
        @@items[id] ||= []
        @@items[id] << item
    end

    def self.get
        ret = []
        @@items.each do |id, item|
            expression = @@expr[id]
            expression = true if expression.nil?
            if expression.is_a?(Hash)
                value = eval(expression[:expr])
                display = value.to_s == expression[:expect_value].to_s
            else
                display = expression
            end
            if display
                ret = ret.concat(@@items[id])
            end
        end
        ret
    end

    def self.set_expr(id, expr)
        @@expr[id] = expr
    end
end
