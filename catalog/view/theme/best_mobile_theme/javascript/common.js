function getURLVar(key) {
  var value = [];
  var query = String(document.location).split('?');
  if (query[1]) {
    var part = query[1].split('&');
    for (i = 0; i < part.length; i++) {
      var data = part[i].split('=');
      if (data[0] && data[1]) {
        value[data[0]] = data[1];
      }
    }

    if (value[key]) {
      return value[key];
    } else {
      return '';
    }
  }
}

$(window).load(function() {
  $("img.lazy").unveil(10, function() {
    $(this).load(function() {
      this.style.opacity = 1;
    });
  });
});


function showAlert(content) {
  layer.open({
    className: 'layer-alert',
    content: content,
    btn: ['OK'],
  });
}

function showToast(content) {
  layer.open({
    className: 'layer-toast',
    content: content,
    skin: 'msg',
    time: 2
  });
}


$(document).ready(function() {



  jQuery(window).scroll(function(){
    if (jQuery(this).scrollTop() > 100) {
      jQuery('.go-top').fadeIn();
      jQuery('.go-home').fadeIn();
    } else {
      jQuery('.go-top').fadeOut();
      jQuery('.go-home').fadeOut();
    }
  });
  // scroll-to-top animate
  jQuery('.go-top').click(function(){
    jQuery("html, body").animate({ scrollTop: 0 }, 400);
      return false;
  });

  // Language
  $(document).delegate('#language a', 'click', function(e){
    e.preventDefault();
    $('#language input[name=\'code\']').attr('value', $(this).attr('href'));
    $('#language').submit();
  })

  // Currency
  $(document).delegate('#currency a', 'click', function(e){
    e.preventDefault();
    $('#currency input[name=\'code\']').attr('value', $(this).attr('href'));
    $('#currency').submit();
  })

  /* Search */
  $('#search input[name=\'search\']').parent().find('input[type="button"]').on('click', function() {
    url = $('base').attr('href') + 'index.php?route=product/search';
    var value = $('#search input[name=\'search\']').val();
    if (value) {
      url += '&search=' + encodeURIComponent(value);
    }
    location = url;
  });

  // Append * to required form input
  $('.form-group').each(function () {
    if ($(this).hasClass('required')) {
      $(this).find('input').attr('placeholder', function(i, val) {
        return val + '*';
      });
    }
  });
});

// Cart add remove functions
var cart = {
  'add': function(product_id, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      beforeSend: function() {

        layer.open({type: 2});

        $('#cart > button').button('loading');
      },
      success: function(json) {
        layer.closeAll();
        if (json['redirect']) {
          location = json['redirect'];
        }

        if (json['success']) {
          showToast(json['success']);
        }
      }
    });
  },
  'update': function(key, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/edit',
      type: 'post',
      data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');
        $('#cart-total').html(json['total']);
        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      }
    });
  },
  'remove': function(key) {
    layer.open({type: 2});
    $.ajax({
      url: 'index.php?route=checkout/cart/remove',
      type: 'post',
      data: 'key=' + key,
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');
        $('#cart-total').html(json['total']);
        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      }
    });
  }
}

var wishlist = {
  'add': function(product_id) {
    $.ajax({
      url: 'index.php?route=account/wishlist/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        if (json['success']) {
          showToast(json['success']);
          $('#button-add-to-wishlist i').addClass('active');
        }
        if (json['info']) {
          showToast(json['info']);
        }
      }
    });
  },
  'remove': function(product_id) {
    $.ajax({
      url: 'index.php?route=account/wishlist/remove',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        if (json['success']) {
          showToast(json['success']);
          $('#button-add-to-wishlist i').removeClass('active');
        }
        if (json['info']) {
          showToast(json['info']);
        }
      }
    });
  }
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					showToast(json['success']);
			$('#button-add-to-compare i').addClass('active');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(product_id) {

	$.ajax({
			url: 'index.php?route=product/compare/remove',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					showToast(json['success']);
			$('#button-add-to-compare i').removeClass('active');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	
	}
}
