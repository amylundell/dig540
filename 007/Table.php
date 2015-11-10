<?php
class Table{
  private $firstNumber;
  private $secondNumber;

  public function setTable($firstNumber, $secondNumber){
  $this->firstNumber = $firstNumber;
  $this->secondNumber = $secondNumber;
  }

  public function multiply(){
    $results = array();
    for($i=0; $i<$this->firstNumber; $i++){
      array_push($results, $i * $this->secondNumber);
    }
    return $results;
  }

  public function getResults(){
    echo $results;
  }
}

?>
