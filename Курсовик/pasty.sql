select * from `catalog`;

select * from name_product where id_name in (1, 3, 11);

select `catalog`.id, type_product.type_prod, name_product.name, form_product.form, taste_product.taste, weight_product.weight,
	unit_product.unit, pack_product.pack, `catalog`.price from `catalog`
	join type_product on `catalog`.id_type_prod  = type_product.id
	join name_product on name_product.id_name = `catalog`.id_name_prod 
	join form_product on form_product.id_form = `catalog`.id_form_prod 
	join taste_product on taste_product.id_taste = `catalog`.id_taste_prod 
	join weight_product on weight_product.id_weight = `catalog`.id_weight_prod 
	join unit_product on unit_product.id_unit = `catalog`.id_base_unit 
	join pack_product on pack_product.id_pack = `catalog`.id_pack_prod;
-- where name_product.id_name = 2;
	
select * from type_product 
	left join `catalog` on `catalog`.id_type_prod = type_product.id;
	
select sum(price * total) as total_sum from orders
	join order_prod on order_prod.order_id = orders.id 
	join `catalog` on `catalog`.id = order_prod.catalog_id 
where orders.id = 1;

select orders.user_name, price * total as total_sum from orders
	join order_prod on order_prod.order_id = orders.id 
	join `catalog` on `catalog`.id = order_prod.catalog_id;
	
select orders.user_name, sum(price * total) as total_sum from orders
	join order_prod on order_prod.order_id = orders.id 
	join `catalog` on `catalog`.id = order_prod.catalog_id
group by orders.user_name;