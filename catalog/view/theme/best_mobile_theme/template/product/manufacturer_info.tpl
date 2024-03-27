<?php echo $header; ?>
<div class="container product-manufacturer">
  <div class="row">
    <div id="content" class="col-xs-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <?php if ($products) { ?>
      <div class="row widget category-sort-widget">
        <div class="col-sm-12">
          <?php /*Order Selections*/
          $sorts_format = array();

          /*default*/
          $sorts_format[] = array(
            'text' => $sorts[0]['text'],
            'href' => $sorts[0]['href'],
            'active' => $sort . '-' . $order == $sorts[0]['value'] ? true : false,
            'type' => true,
          );

          for ($i=1; $i < count($sorts); $i+=2) {
            $sorts_format[] = array(
            'text' => mb_substr($sorts[$i]['text'], 0, mb_strpos($sorts[$i]['text'], ' ')),
            'href' => $sort . '-' . $order == $sorts[$i]['value'] ? $sorts[$i+1]['href'] : $sorts[$i]['href'],
            'active' => ($sort . '-' . $order == $sorts[$i]['value'] || $sort . '-' . $order == $sorts[$i+1]['value']) ? true : false,
            'type' => $sort . '-' . $order == $sorts[$i]['value'] ? false : true,
          );
          }?>
          <ul>
            <?php foreach ($sorts_format as $sort_item) : ?>
            <li><a class="<?php echo $sort_item['active'] ? 'active' : ''?>" href="<?php echo $sort_item['href']; ?>"><?php echo $sort_item['text'];?> <i class="fa <?php echo $sort_item['active'] ? ($sort_item['type'] ? 'fa-level-down' : 'fa-level-up') : 'fa-sort'?>"></i></a></li>
            <?php endforeach; ?>
          </ul>
        </div>
      </div>
      <div class="row widget product-list-item-style grid">
        <?php foreach ($products as $product) { ?>
        <div class="col-xs-6">
          <div class="product-item-wrapper">
            <div class="image">
            <a href="<?php echo $product['href']; ?>"><img data-src="<?php echo $product['thumb'] ?>" src="<?php echo $placeholder ?>" class="lazy img-responsive"></a>
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
      <?php if ($pagination): ?>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      </div>
      <?php endif ?>
      <?php } else { ?>
        <!-- No products -->
        <div class="empty-placeholder"><?php echo $text_empty; ?></div>
        <div class="buttons">
          <a href="<?php echo $continue; ?>" class="btn btn-primary btn-block"><?php echo $button_continue; ?></a>
        </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>
