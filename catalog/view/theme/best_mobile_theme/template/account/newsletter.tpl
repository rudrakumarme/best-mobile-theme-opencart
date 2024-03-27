<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-sm-12">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
                <div class="col-sm-10">
                  <?php if ($newsletter) { ?>
                  <label class="radio-inline">
                    <input type="radio" name="newsletter" value="1" checked="checked" />
                    <?php echo $text_yes; ?> </label>
                  <label class="radio-inline">
                    <input type="radio" name="newsletter" value="0" />
                    <?php echo $text_no; ?></label>
                  <?php } else { ?>
                  <label class="radio-inline">
                    <input type="radio" name="newsletter" value="1" />
                    <?php echo $text_yes; ?> </label>
                  <label class="radio-inline">
                    <input type="radio" name="newsletter" value="0" checked="checked" />
                    <?php echo $text_no; ?></label>
                  <?php } ?>
                </div>
              </div>
            </fieldset>
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary btn-block" />
          </form>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
