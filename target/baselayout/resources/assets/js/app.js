var HomepageView = Backbone.View.extend({
    el: '.page',
    render: function () {
        var that = this;
        var template = _.template($('#homepage').html(), {});
        that.$el.html(template);
    }
});

var homepageView = new HomepageView();

var AboutView = Backbone.View.extend({
    el: '.page',
    render: function () {
        var that = this;
        var template = _.template($('#about').html(), {});
        that.$el.html(template);
    }
});

var aboutView = new AboutView();

var Products = Backbone.Collection.extend({
    url: '/list_products'
});

var ProductListView = Backbone.View.extend({
    el: '.page',
    render: function () {
        var that = this;
        var products = new Products();
        products.fetch({
            success: function (products) {
                var template = _.template($('#product-list-template').html(), {products: products.models});
                that.$el.html(template);
            }
        })
    }
});

var productListView = new ProductListView();

var OpenProductView = Backbone.View.extend({
    el: '.page',

    render: function (options) {
        var that = this;
        if(options.id) {
            that.product = new Single_Product({id: options.id});
            that.product.fetch({
                success: function (product) {
                    var template = _.template($('#open-product-template').html(), {product: product});
                    that.$el.html(template);
                }
            })
        } else {
            var template = _.template($('#open-product-template').html(), {person: null});
            that.$el.html(template);
        }
    }
});

var openProductView = new OpenProductView();

var Single_Product = Backbone.Model.extend({
    urlRoot: '/product'
});

/*
 
var ProductEditView = Backbone.View.extend({
    el: '.page',
    events: {
        'submit .edit-product-template': 'saveProduct'
    },
    saveProduct: function (ev) {
        var productDetails = $(ev.currentTarget).serializeObject();
        var product = new Single_Product();
        product.save(productDetails, {
            success: function (product) {
                router.navigate('products', {trigger:true});
            }
        });
        return false;
    }
});

var productEditView = new ProductEditView();

*/
var SaleView = Backbone.View.extend({
    el: '.page',
    render: function () {
        var that = this;
        var template = _.template($('#edit-product-template').html(), {});
        that.$el.html(template);
    }
});

var saleView = new SaleView();

/**
 * Router
 */

var Router = Backbone.Router.extend({
    routes: {
        "": "home",
        "products": "products",
        "product/:id": "openProduct",
        "sale": "saleProduct",
        "about": "about"
    }
});


var router = new Router;

router.on('route:home', function() {
    homepageView.render();
})
router.on('route:home', function() {
    homepageView.render();
})
router.on('route:products', function() {
    productListView.render();
})
router.on('route:openProduct', function(id) {
	openProductView.render({id: id});
})
router.on('route:saleProduct', function() {
	saleView.render();
})
router.on('route:about', function() {
    aboutView.render();
})

Backbone.history.start();