with payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,

        -- amount is stored in cents, convert it to dollars
        amount / 100 as amount,
        created as created_at
    from
        dbt_training.stripe.payment
)

select payment_id, order_id, payment_method, status, amount, created_at from payments