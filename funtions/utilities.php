<?php
function isPost():bool
{
  return strtoupper($_SERVER['REQUEST_METHOD']) === 'POST';
}
function escapse(string $value):string
{
  return htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
}
function redirectIfNotLogged(string $sourceTarget)
{
  if(isLoggedIn())
  {
  return true;
  }
  $_SESSION['redirectTarget'] = BASE_URL.'index.php'.$sourceTarget;
  header("Location: ".BASE_URL."index.php/login");
  exit();
}
function flashMessage(?string $message = null)
{
  if(!isset($_SESSION['messages']))
  {
    $_SESSION['messages']=[];
  }
  if(!$message)
  {
    $messages = $_SESSION['messages'];
    $_SESSION['message']=[];
    return $messages;
  }
  $_SESSION['messages'][]=$message;
}
