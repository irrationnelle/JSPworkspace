jQuery(document).ready(function() {
    "use strict";
		
	jQuery("[data-toggle]").click(function(){
		var toggleTarget = jQuery(this).data("toggle");
		jQuery(toggleTarget).toggleClass("is-active");
		return false;
	});
	
	jQuery('#close_btn_right1').on('click', function (){
		jQuery('#slide_cart').slideReveal("hide");
	});	
	jQuery('#close_btn_right').on('click', function (){
		jQuery('#slide_menu').slideReveal("hide");
	});	
	jQuery('#slide_cart').slideReveal({
		trigger: jQuery("#cart-black"),
		position: "right",
		push: true,
		autoEscape: true,
		width: 350,
		speed: 700
	});	
	jQuery('#slide_menu').slideReveal({
		trigger: jQuery("#menu_slide"),
		position: "left",
		push: true,
		autoEscape: true,
		width: 350,
		speed: 700
	});  
	
	jQuery(".show-more").click(function(){		
		jQuery(".right_pro_detail").toggleClass("right_pro_detail_1")
		jQuery(".product_bill_info").toggleClass("product_bill_info_1")
	});

	jQuery("#detail_featured_product_slider .slider-items").owlCarousel({
		items: 4, //10 items above 1000px browser width
		itemsDesktop: [1024, 4], //5 items between 1024px and 901px
		itemsDesktopSmall: [900, 2], // 3 items betweem 900px and 601px
		itemsTablet: [600, 2], //2 items between 600 and 0;
		itemsMobile: [320, 1],
		navigation: true,
		navigationText: ["<a class=\"flex-prev\"></a>", "<a class=\"flex-next\"></a>"],
		slideSpeed: 500,
		pagination: false
	});
	
	jQuery("#category-products .slider-items").owlCarousel({
		items: 4, //10 items above 1000px browser width
		itemsDesktop: [1024, 4], //5 items between 1024px and 901px
		itemsDesktopSmall: [900, 2], // 3 items betweem 900px and 601px
		itemsTablet: [600, 2], //2 items between 600 and 0;
		itemsMobile: [320, 1],
		navigation: true,
		navigationText: ["<a class=\"flex-prev\"></a>", "<a class=\"flex-next\"></a>"],
		slideSpeed: 500,
		pagination: false
	});
	
	jQuery(".topnav").accordionNew({
        accordion: true,
        speed: 300,
        closedSign: '+',
        openedSign: '-'
    });
	
	jQuery("ul.accordion li.parent, ul.accordion li.parents, ul#magicat li.open").each(function() {
        jQuery(this).append('<em class="open-close">&nbsp;</em>');
    });
	
    jQuery('ul.accordion, ul#magicat').accordionNew();
	
    jQuery("ul.accordion li.active, ul#magicat li.active").each(function() {
        jQuery(this).children().next("div").css('display', 'block');
    });
	
});
	
	
/* Sidebar Dropdown */
(function(jQuery) {
    jQuery.fn.extend({
        accordionNew: function() {
            return this.each(function() {
                var jQueryul = jQuery(this),
                    elementDataKey = 'accordiated',
                    activeClassName = 'active',
                    activationEffect = 'slideToggle',
                    panelSelector = 'ul, div',
                    activationEffectSpeed = 'fast',
                    itemSelector = 'li';
                if (jQueryul.data(elementDataKey))
                    return false;
                jQuery.each(jQueryul.find('ul, li>div'), function() {
                    jQuery(this).data(elementDataKey, true);
                    jQuery(this).hide();
                });
                jQuery.each(jQueryul.find('em.open-close'), function() {
                    jQuery(this).click(function(e) {
                        activate(this, activationEffect);
                        return void(0);
                    });
                    jQuery(this).bind('activate-node', function() {
                        jQueryul.find(panelSelector).not(jQuery(this).parents()).not(jQuery(this).siblings()).slideUp(activationEffectSpeed);
                        activate(this, 'slideDown');
                    });
                });
                var active = (location.hash) ? jQueryul.find('a[href=' + location.hash + ']')[0] : jQueryul.find('li.current a')[0];
                if (active) {
                    activate(active, false);
                }

                function activate(el, effect) {
                    jQuery(el).parent(itemSelector).siblings().removeClass(activeClassName).children(panelSelector).slideUp(activationEffectSpeed);
                    jQuery(el).siblings(panelSelector)[(effect || activationEffect)](((effect == "show") ? activationEffectSpeed : false), function() {
                        if (jQuery(el).siblings(panelSelector).is(':visible')) {
                            jQuery(el).parents(itemSelector).not(jQueryul.parents()).addClass(activeClassName);
                        } else {
                            jQuery(el).parent(itemSelector).removeClass(activeClassName);
                        }
                        if (effect == 'show') {
                            jQuery(el).parents(itemSelector).not(jQueryul.parents()).addClass(activeClassName);
                        }
                        jQuery(el).parents().show();
                    });
                }
            });
        }
    });
})(jQuery);