<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div id="slide_cart">
        <div class="side-menu">
            <div class="drawer_header">
                <div class="drawer_title">Shopping Cart</div>
            </div>
            <a id="close_btn_right1" class="close_btn_right">×</a>
            <div id="CartContainer">
                <form class="cart" novalidate="" method="post" action="/cart">
                    <div class="ajaxcart_inner">
                        <div class="ajaxcart_product">
                            <div data-id="1572057028" class="ajaxcart_row">
                                <div class="grid display-table">
                                    <div class="grid_item one_fifth">
                                        <a class="ajaxcart_product_image img-responsive" href="category.html"><img alt="" src="images/small_image.jpg"></a>
                                    </div>
                                    <div class="grid_item four_fifths">
                                        <p>
                                            <a class="ajaxcart_product_name" href="category.html">Blue Top</a>
                                            <span class="ajaxcart_product_meta">Fancy / Smallish Top</span>
                                        </p>
                                        <div class="grid_full display_table">
                                            <div class="grid_item display_table-cell one_half">
                                                <div class="ajaxcart_qty">
                                                    <button type="button" class="ajaxcart_qty_adjust ajaxcart_qty_minus" 
                                                    	onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;">−</button>
                                                    <input type="text" name="qty" id="qty" maxlength="12" value="1" title="Qty" class="ajaxcart_qty_num">
                                                    <button type="button" class="ajaxcart_qty_adjust ajaxcart_qty_plus"
                                                    	 onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;">+</button>
                                                </div>
                                            </div>
                                            <div class="grid_item display_table_cell one_half text-right">
                                                <span class="ajaxcart_price">$58.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ajaxcart_product">
                            <div data-id="1572057028" class="ajaxcart_row">
                                <div class="grid display-table">
                                    <div class="grid_item one_fifth">
                                        <a class="ajaxcart_product_image img-responsive" href="category.html"><img alt="" src="images/small_image.jpg"></a>
                                    </div>
                                    <div class="grid_item four_fifths">
                                        <p>
                                            <a class="ajaxcart_product_name" href="category.html">Red Top</a>
                                            <span class="ajaxcart_product_meta">Fancy / sleeveless Top</span>
                                        </p>
                                        <div class="grid_full display_table">
                                            <div class="grid_item display_table-cell one_half">
                                                <div class="ajaxcart_qty">
                                                    <button type="button" class="ajaxcart_qty_adjust ajaxcart_qty_minus" 
                                                    	onclick="var result = document.getElementById('qty_1'); var qty_1 = result.value; if( !isNaN( qty_1 ) &amp;&amp; qty_1 &gt; 0 ) result.value--;return false;">−</button>
                                                    <input type="text" name="qty_1" id="qty_1" maxlength="12" value="1" title="Qty_1" class="ajaxcart_qty_num">
                                                    <button type="button" class="ajaxcart_qty_adjust ajaxcart_qty_plus"
                                                    	 onclick="var result = document.getElementById('qty_1'); var qty_1 = result.value; if( !isNaN( qty_1 )) result.value++;return false;">+</button>
                                                </div>
                                            </div>
                                            <div class="grid_item display_table_cell one_half text-right">
                                                <span class="ajaxcart_price">$78.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ajaxcart_footer">
                        <div class="grid_full">
                            <div class="grid_item caps">
                                <p>Subtotal</p>
                            </div>
                            <div class="grid_item one_third">
                                <p>$136.00</p>
                            </div>
                            <br /><br />
                        </div>
                        <button title="Proceed to Checkout" type="button" id="btn_cart">View Cart</button>
                        <button title="Proceed to Checkout" type="button" class="btn_proceed" id="btn_proceed">Checkout</button>
                    </div>
                </form>                
            </div>
        </div>
    </div>