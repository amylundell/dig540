<?php
require_once('Table.php');
?>

<html>
  <head>
    <title>Multiplication Tables</title>
    </head>
    <body>
      Multiplication Table <br/><br/>
      How to find out the multiplication table for any number (multiplied up to 12). <br/><br/>
      Just enter an number and hit &quot;Submit&quot;.<br/><br/>

      <form method="POST" action="">
        Number: <input name="number"/><br/>
        <input type="submit" value="Submit"/><br/><br/>
      </form>

<?php
if(is_numeric($_POST['number']) && $_POST['number'] !=''){
  $myTable = new Table();
  $myTable->setTable('12', $_POST['number']);
  $myTable->multiply();
  $myTable->getResults();
}else{
  echo "Please enter a number (postive, negative, or decimal).";
}
?>
</body>
</html>
