<?php echo $header; ?>
<div class="container wishlist-page">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <div class="row widget">
        <div class="col-sm-12">
          <?php if ($products) { ?>
          <div class="row">
            <div class="col-xs-12">
              <?php foreach ($products as $product) { ?>
              <div class="wishlist-product-list">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img data-src="<?php echo $product['thumb']; ?>" src="<?php echo $placeholder; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="lazy img-responsive" /></a></div>
                <div class="product-info">
                  <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                  <div class="model"><?php echo $product['model']; ?></div>
                  <div class="stock"><?php echo $product['stock']; ?></div>
                  <?php if ($product['price']) { ?>
                  <div class="product-price">
                    <span class="price-new"><?php echo $product['special'] ? $product['special'] : $product['price']; ?></span>
                    <?php if ($product['special']) { ?><span class="price-old"><?php echo $product['price']; ?></span><?php } ?>
                  </div>
                  <?php } ?>
                  <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="remove">[<?php echo $button_remove; ?>]</a>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } else { ?>
          <div class="no-items">
            <div class="icon"><i class="iconfont">&#xe635;</i></div>
            <div class="msg"><?php echo $text_empty; ?></div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
  </div>
</div>
<?php echo $footer; ?>
