		  	  <div class="row widget account-page">
        <div class="col-sm-12">
          <div class="order-button-groups">
		  
            <!-- Add Tabs -->
			
			
            <div class="order-button filter-i"><a data-toggle="modal" data-target="#filter"><i style="background-position: 0px -193px;"></i><span>Filter</span></a></div>
			
						<div class="order-button filter-i"><a data-toggle="modal" data-target="#sorting"><i style="background-position: 0px -163px;"></i><span>Sort By</span></a></div>
						
						
						
			          
			
			          </div>
        </div>
      </div>
	
  <!-- Modal -->
  <div class="modal bottom fade" id="filter" role="dialog">
    
    <div class="modal-dialog" role="document">
      <!-- Modal content-->
      <div style="bottom: 0;border-radius: 0px;border:none;z-index: 100;height:100%;position: fixed;bottom: 0;left: 0;right: 0;background: #f5f5f7;" class="modal-content popup_box">
	  
	  <div id="top-search" class="container">
     <a data-dismiss="modal" class="category"><i class="iconfont">&#xe622;</i>
    </a>
	<a class="placeholder" style="padding: 0 0px;"><span style="font-size: 18px;font-weight: 500;">Filter</span></a>
	
    <div class="change-bg"></div>
  </div>
  
  
         <div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>

</div>

                </div>
      </div>

<style>		

.cancel-continue { z-index: 100;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #f8f8f8;
    min-height: 40px;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    -ms-align-items: center;
    align-items: center;
	
}

.button-continue {
    background-color: #fb641b;
	width: 100%;
    color: #fff;
    font-size: 14px;
	    border: none;
    height: 50px;
}

.button-cancel {
    background-color: #272727;
	width: 100%;
    color: #fff;
    font-size: 14px;
	    border: none;
    height: 50px;
}

.cancel {

width:50%;	
	
}	

.continue {
	
width:50%;	
	
}	

.modal fade {
  position: relative;
  bottom: -250px;
  margin: 150px auto 0;
  padding: 40px;
  max-width: 60%;
  height: auto;
  background-color: rgb(248, 250, 247);
  border: 1px solid #BEBEBE;
  opacity: 0;
  -webkit-transition: opacity 0.3s ease-out, bottom 0.3s ease-out;
  -moz-transition: opacity 0.3s ease-out, bottom 0.3s ease-out;
  -o-transition: opacity 0.3s ease-out, bottom 0.3s ease-out;
  transition: opacity 0.3s ease-out, bottom 0.3s ease-out;
}


</style>


		
		<nav class="cancel-continue">
  <div data-dismiss="modal" class="cancel"><button class="button-cancel">Cancel</button></div>
  <div class="continue" ><button id="button-filter" class="button-continue"><?php echo $button_filter; ?></button></div>

  
  
  
</nav>
		
      </div>
      





<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
