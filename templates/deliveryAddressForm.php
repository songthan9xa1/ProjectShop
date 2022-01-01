<form method="POST" action="index.php/deliveryAdress/add">
  <div class="card">
    <div class="card-header">
      Neue Adresse eintragen
    </div>
    <div class="card-body">
      <?php if($hasErrors):?>
        <ul class="alert alert-danger">
          <?php foreach($errors as $errorMessage):?>
            <li><?= $errorMessage ?></li>
          <?php endforeach;?>
        </ul>
      <?php endif?>
      <div class="form-group">
        <label for="recipient">Empfänger</label>
        <input name="recipient" value="<?= escapse($recipient) ?>" class="form-control<?= $recipientIsValid?' ':' is-invalid'?>" id="recipient">
      </div>
      <div class="form-group">
        <label for="city">Stadt</label>
        <input name="city" value="<?= escapse($city) ?>" class="form-control<?= $cityIsValid?' ':' is-invalid'?>" id="city">
      </div>
      <div class="form-group">
        <label for="zipCode">PLZ</label>
        <input name="zipCode" value="<?= escapse($zipCode) ?>" class="form-control<?= $zipCodeIsValid?' ':' is-invalid'?>" id="zipCode">
      </div>
      <div class="form-group">
        <label for="street">Strasse</label>
        <input name="street" value="<?= escapse($street) ?>" class="form-control<?= $streetIsValid?' ':' is-invalid'?>" id="street">
      </div>
      <div class="form-group">
        <label for="streetNumber">Hausnummer</label>
        <input name="streetNumber" value="<?= escapse($streetNumber) ?>" class="form-control<?= $streetNumberIsValid?' ':' is-invalid'?>" id="streetNumber">
      </div>
    </div>
    <div class="card-footer">
      <button class="btn btn-success">Speichern</button>
    </div>
  </div>
</form>
