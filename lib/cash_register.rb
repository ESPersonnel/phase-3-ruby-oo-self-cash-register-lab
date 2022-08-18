# CashRegister
#   .new
#     sets an instance variable @total on initialization to zero (FAILED - 1)
#     takes one optional argument, an employee discount, on initialization (FAILED - 2)
#   #total
#     returns the current total (FAILED - 3)
#   #add_item
#     accepts a title and a price and increases the total (FAILED - 4)
#     also accepts an optional quantity (FAILED - 5)
#     doesn't forget about the previous total (FAILED - 6)
#   #apply_discount
#     when the cash register was initialized with an employee discount
#       applies the discount to the total price (FAILED - 7)
#       returns success message with updated total (FAILED - 8)
#       reduces the total (FAILED - 9)
#     when the cash register was not initialized with an employee discount
#       returns a string error message that there is no discount to apply (FAILED - 10)
#   #items
#     when called with two arguments
#       returns an array containing all items that have been added (FAILED - 11)
#     when called with three arguments
#       returns an array containing all items that have been added, including multiples (FAILED - 12)
#   #void_last_transaction
#     subtracts the last item from the total (FAILED - 13)
#     returns the total to 0.0 if all items have been removed (FAILED - 14)

require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items
  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
  end

  def total
    @total
  end
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @items << title * quantity
  end
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total - (@total * @discount / 100)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

# #items
# when called with two arguments
#     returns an array containing all items that have been added
#   when called with three arguments
#     returns an array containing all items that have been added, including multiples

    def items
      @items
    end
    def void_last_transaction
      @total = @total - @items.last.to_i
      @items.pop
    end
end