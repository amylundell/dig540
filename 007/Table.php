<?php
class Table{
  private $firstNumber;
  private $secondNumber;
  private $results;

  public function setTable($firstNumber, $secondNumber){
  $this->firstNumber = $firstNumber;
  $this->secondNumber = $secondNumber;
  }

  public function multiply(){
    $results = array();
    for($i=0; $i<$this->firstNumber; $i++){
      array_push($results, $i * $this->secondNumber);
    }
    $this->results = $results;
    return $results;
  }

  public function getResults(){
    print "<pre>";
    print_r($this->results);
    print "</pre>";

  }
}

?>
