Deface::Override.new(:virtual_path => 'products/_cart_form',
                     :replace => "[data-hook='inside_product_cart_form']",
                     :partial => "../views/products/variant_selects",
                     :name => "variant_select")