require 'pry'

class CashRegister
    attr_accessor :total, :discount, :quantity, :removed
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @arr = []
    end

    def self.total
        @@total += @total
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity

        @removed = price * quantity

        quantity.times do 
            @arr << title 
        end
    end

    def apply_discount
        @discount = @discount/100.0
        if @discount > 0
            @total -= @total * @discount
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @arr
    end

    def void_last_transaction
       self.total = self.total - self.removed
    end

end
