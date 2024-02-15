select 
    order_id,
    payment_value
from {{ref('orders')}}
having not(payment_value>=0)