
with customers as (

     select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}


),

customer_orders as (

    select
        order_id,
        customer_id,
        ordered_at
    from orders

),

final as (

    select
        customers.customer_id,
        customers.name,
        customer_orders.ordered_at
    from customers

    left join customer_orders using (customer_id)

)

select * from final