require 'pry'
class CashRegister
    attr_accessor :total, :last_item
    attr_reader :items, :discount
    
    def initialize(discount=0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def add_item(item,price,quantity=1)
        @total += price*quantity
        quantity.times do @items << item
        @last_item = {:item => item, :price => price, :quantity => quantity}
        end
    end

    def apply_discount
        if @discount === 0
            return "There is no discount to apply."
        else
             @total -= ( @total* @discount)/100.0
        return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        if @items.length <= 1
            @items = []
            @total = 0.0
        else
            @last_item[:quantity].times do @items.pop end
            binding.pry
            @total -= @last_item[:price]
        end
    end
end