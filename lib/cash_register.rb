require 'pry'
require 'pp'
class CashRegister
    attr_accessor :total, :discount, :last_price, :last_quantity

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
        @last_price = []
        @last_quantity = 0

    end



    #
    # class methods
    #


    def add_item(name, price, quantity=1)
        i = 0
        while i < quantity do
            self.items << name
            self.last_price << price
            i += 1
        end 
        self.total += (price * quantity)
        self.last_quantity = quantity
    end

    def apply_discount
        if discount > 0
            self.total = self.total * (100-discount) / 100
            p "After the discount, the total comes to $#{total.round}."
        else
            p "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        item = self.items.pop()

        if self.items.empty? or self.total == 0
            self.total = 0.0
            self.last_price = []
        else
            num = self.last_price.pop()
            i = 1
            while i < self.last_quantity do
                num += self.last_price.pop()
                i+= 1
            end
            
            self.total -= num
        end
    end

end
