<div class="row product-list-item-style product-min-box">
  <div class="module-title"><span></span><h2><?php echo $heading_title; ?></h2><span></span></div>
  <div class="product-box">
    <?php foreach ($products as $product) { ?>
    <div class="col-xs-3 product-item">
      <div class="product-item-wrapper">
        <div class="image">
        <a href="<?php echo $product['href']; ?>"><img data-src="<?php echo $product['thumb'] ?>" src="<?php echo $placeholder ?>" class="lazy img-responsive"></a>
        </div>
        <div class="info">
          <?php if ($product['price']) { ?>
          <div class="price">
            <?php if (!$product['special']) { ?>
            <span class="price-new"><?php echo $product['price']; ?></span>
            <?php } else { ?>
            <span class="price-old"><?php echo $product['price']; ?></span>
            <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>
</div>
