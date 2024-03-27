<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12">
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
	  
	  <?php echo $content_top; ?>
	  
      <?php if ($products) { ?>

	  
      <div class="row product-list-item-style product-grid-box">
        <?php foreach ($products as $product) { ?>
        <div class="col-xs-6 product-item">
          <div class="product-item-wrapper">
            <div class="image">
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb'] ?>" class="img-responsive"></a>
            </div>
            <div class="info">
              <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <span class="price-new"><?php echo $product['price']; ?></span>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
              </div>
              <?php } ?>

            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      </div>
      <?php } else { ?>
        <!-- No products -->
        <div class="no-items">
          <span class="icon"><i class="iconfont">&#xe69a;</i></span>
          <span class="msg"><?php echo $text_empty; ?></span>
          <a href="<?php echo $continue; ?>" class="btn btn-primary btn-block"><?php echo $button_continue; ?></a>
        </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
</div>
</div>
<?php echo $footer; ?>
