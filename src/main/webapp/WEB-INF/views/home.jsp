<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../../resources/assets/img/favicon.ico">

    <title>Market Place</title>

    <!-- Bootstrap core CSS -->
    <link href="../../resources/assets/css/dist/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../resources/assets/css/dist/jumbotron.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="../../resources/assets/js/libs/html5shiv.js"></script>
    <script src="../../resources/assets/js/libs/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Base layout</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="#sale">Sale</a></li>
                <li><a href="#products">Products</a></li>
                <li><a href="#about">About</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="page"></div>

<div class="container">
    <hr>
    <footer>
        <p>&copy; Teste Valemobi</p>
    </footer>
</div> <!-- /container -->

<!-- Placed at the end of the document so the pages load faster -->
<script src="../../resources/assets/js/libs/jquery.js"></script>
<script src="../../resources/assets/js/libs/bootstrap.min.js"></script>
<script src="../../resources/assets/js/libs/json2.js"></script>
<script src="../../resources/assets/js/libs/underscore.js"></script>
<script src="../../resources/assets/js/libs/backbone.js"></script>
<script src="../../resources/assets/js/libs/mustache.js"></script>
<script src="../../resources/assets/js/app.js"></script>    

<!-- Change underscore's interperation symbols from \<\% to \<\@ http://stackoverflow.com/a/8467907/2498874 -->
<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
</script>


<!-- TEMPLATES -->
<script type="text/template" id="homepage">

    <div class="jumbotron">
        <div class="container">
            <h1>Teste Valemobi</h1>
            <p>Essa página foi desenvolvida para realização de um teste da empresa Valemobi.</p>
        </div>
    </div>

</script>

<script type="text/template" id="about">

    <div class="container">

        <h1>Sobre o Desenvolvedor</h1>

        <p>Olá! Eu sou o Fabio</p>

        <p>Tenho 21 anos e há cerca de 3 anos tive meu primeiro contato com a programação, desde então sou extremamente apaixonado por tecnologia.</p>
        <p>Meus estudos são focados na tecnologia Java e devido à minha última experiência profissional com desenvolvimento, tenho me focado principalmente
			no framework Spring.</p>
        <p>Para essa página, usei praticamente um projeto que já tinha 50% pronto. Java com Spring MVC, Hibernate e PostgreSQL para a parte de Back-end.
			Backbone.js e JQuery para o front-end.</p>

    </div>

</script>

<script type="text/template" id="product-list-template">

    <div class="container">

        <h1>Products</h1>

        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Type</th>
                    <th>Quantity</th>
					<th>Buy</th>
                </tr>
                </thead>
                <tbody>
                    <@ _.each(products, function(product) { @>
                        <tr>
                            <td><@= htmlEncode(product.get('name')) @></td>
                            <td>R$ <@= htmlEncode(product.get('price')) @></td>
                            <td><@= htmlEncode(product.get('type')) @></td>
                            <td><@= htmlEncode(product.get('quantity')) @></td>
                            <td><a href="#product/<@= product.id @>" class="btn btn-info btn-xs">See more</a></td>
                        </tr>
                    <@ }); @>
                </tbody>
            </table>
        </div>
    </div>

</script>


<script type="text/template" id="open-product-template">
    <div class="container">
        <form class="open-product-form">

            <h1><@= htmlEncode(product.get('name')) @></h1>
			<p><@= htmlEncode(product.get('locale')) @></p>

            <div class="form-group">
				<table>
					<td>
						<tr>
                			<label>Description</label>					
							<p><@= htmlEncode(product.get('description')) @></p>				
						</tr>
					</td>
					<td>
						<tr>
							<p><b>R$ <@= htmlEncode(product.get('price')) @></b></p>				
							<p>Contact: <@= htmlEncode(product.get('tel')) @></p>				
						</tr>
					</td>
				</table>
            </div>

            <hr />

            <button type="submit" class="btn btn-primary">Buy</button>

        </form>
    </div>
</script>


<script type="text/template" id="edit-product-template">
    <div class="container">

        <form class="edit-product-form" action="/product" method="POST" enctype='application/json'>

            <h1>Product</h1>


            <div class="form-group">
                <label for="name">Name</label>
                <input name="name" id="name" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="type">Type</label>
                <input name="type" id="type" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input name="quantity" id="quantity" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <input name="price" id="price" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <input name="description" id="description" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="tel">Telphone</label>
                <input name="tel" id="tel" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="locale">Locale</label>
                <input name="locale" id="locale" type="text" class="form-control">
            </div>

            <hr />

            <button type="submit" class="btn btn-primary">Save</button>

        </form>
    </div>
</script>


<!-- HELPERS -->

<script>
    function htmlEncode(value){
        return $('<div/>').text(value).html();
    }
    $.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
</script>

</body>
</html>
