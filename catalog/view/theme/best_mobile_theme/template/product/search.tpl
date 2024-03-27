<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12">
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-xs-12">
          <div id="search" class="input-group">
            <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" class="form-control" />
            <input type="hidden" name="category_id" value="0"/>
            <input type="hidden" name="sub_category" value="1"/>
            <input type="hidden" name="description" value="1"/>
            <span class="input-group-btn">
              <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
            </span>
          </div>
        </div>
      </div>
      <?php if (!$products) { ?>
      <?php echo $content_top; ?>
      <?php } ?>
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
      <div class="no-items">
        <span class="icon"><i class="iconfont">&#xe69a;</i></span>
        <span class="msg"><?php echo $text_empty; ?></span>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>

<?php echo $footer; ?>
