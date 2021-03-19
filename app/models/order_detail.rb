class OrderDetail < ApplicationRecord

    enum making_status: { impossible: 1, waiting: 2, making: 3, completed: 4 }
  # 着手不可：1　製作待ち：2　製作中：3　製作完了：4

end
