
class CashRegister 

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :total
    attr_reader :items, :discount

    def add_item(item, price, quantity=1)
        #! Sets old total for use in void_last_transaction
        @oldtotal = @total
        #! adds items to the item array and total
        quantity.times do
            @items << item
            @total += price
        end

    end

    def apply_discount
        #! set original total
        prediscount = @total
        #! spplies discount
        @total = ((100 - @discount) * @total)/100
        #! compares old & new total for correct reply.
        prediscount == @total ? "There is no discount to apply." : "After the discount, the total comes to $#{@total}." 
    end

    def void_last_transaction
        #! voids last transaction by using old total. 
        #? However, doesn't remove items from cart
        @total = @oldtotal
    end






end