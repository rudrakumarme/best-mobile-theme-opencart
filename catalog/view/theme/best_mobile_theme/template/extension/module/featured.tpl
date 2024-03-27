<div class="module-title"><span></span><h2><?php echo $heading_title; ?></h2><span></span></div>
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
