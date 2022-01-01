<div class="card">
  <div class="card-title"><?=$product['titel']?></div>
  <img class="card-img-top" src="<?=$product['image']?>" alt="products">
  <div class="card-body">
    <?=$product['describtion']?>
    <hr>
    <?=$product['price']?>
  </div>
  <div class="card-footer">
    <a href="" class="btn btn-primary btn-sm">details</a>
    <a href="index.php/cart/add/<?= $product['id']?>" class="btn btn-success btn-sm">In den Warenkorb</a>
  </div>
</div>
