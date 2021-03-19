class Order < ApplicationRecord

  enum payment: { credit: 1, bank: 2 }
  # クレジットカード：1　銀行振込：2

  enum order_status: { waiting: 1, confirmation: 2, making: 3, preparing: 4, shipped: 5 }
  # 入金待ち：1　入金確認：2　製作中：3　発送準備中：4　発送済み：5

end
