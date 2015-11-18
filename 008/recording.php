<?php
  class Recording{
    private $id;
    private $title;
    private $version;
    private $language;
    private $narration_type;
    private $running_time;
    private $zip_file_size;
    private $catalog_date;
    private $website_link;

    public function __construct($_title, $_version='', $_language='', $_narration_type='', $_running_time='', $_zip_file_size='', $_catalog_date='', $_website_link=''){
      if(empty($_title)) return false;

      $this->title=$_title;
      $this->version=$_version;
      $this->language=$_language;
      $this->narration_type=$_narration_type;
      $this->running_time=$_running_time;
      $this->zip_file_size=$_zip_file_size;
      $this->catalog_date=$_catalog_date;
      $this->website_link=$_website_link;

    }

    public static function read($id){
      global $db;

      if($db){
        $q = $db->prepare('SELECT * FROM recording WHERE id = ?');
        $q->execute(array($id));
        if($item = $q->fetch()){
          $recording = new Recording ($item['title'], $item['version'], $item['language'], $item['narration_type'], $item['running_time'], $item['zip_file_size'], $item['catalog_date'], $item['website_link']);
          $recording->setID($item['id']);
          return $item;
        }
      }
      return false;
    }

    public function create(){
      global $db;

      if($db){
        $db->beginTransaction();
        $q = $db->prepare('INSERT INTO `recording` (title, version, language, narration_type, running_time, zip_file_size, catalog_date, website_link) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
        try{
          $q->execute(array($this->title, $this->version, $this->language, $this->narration_type, $this->running_time, $this->zip_file_size, $this->catalog_date, $this->website_link));
        } catch(PDOException $e) {
          print_r($e);
          $db->rollback();
          return false;
        }
        $this->id = $db->lastInsertId();
        $db->commit();
        return true;
      }
      return false;
    }

public function update(){
  global $db;

  if($db){
    $db->beginTransaction();
    $q = $db->prepare('UPDATE `recording` SET `title` = ?, `version` = ?, `language` = ?, `narration_type` = ?, `running_time` = ?, `zip_file_size` = ?, `catalog_date` = ?, `website_link` = ? WHERE `id` = ?');
    try{
      $q->execute(array($this->title, $this->version, $this->language, $this->narration_type, $this->running_time, $this->zip_file_size, $this->catalog_date, $this->website_link, $this->id));
    } catch(PDOException $e) {
      print_r($e);
      $db->rollback();
      return false;
    }
    $db->commit();
    return true;
  }
    return false;
}

public function delete(){
  global $db;

  if($db){
    $db->beginTransaction();
    $q = $db->prepare('DELETE FROM `recording` WHERE id = ?');
    try{
      $q->execute(array($this->id));
    } catch(PDOException $e) {
      print_r($e);
      $db->rollback();
      return false;
    }
    $db->commit();
    return true;
  }
    return false;
}

public static function recording_list(){
  global $db;

  if($db){
    $q = $db->prepare('SELECT title FROM recording');
    try{
      $q->execute();
      $result = $q->fetchAll(PDO::FETCH_COLUMN, 0);
      print_r($result);
    }catch(PDOException $e) {
      print_r($e);
      $db->rollback();
      return false;
    }
  }
  return false;
}

public static function find($title){
  global $db;

  if($db){
    $q = $db->prepare('SELECT * FROM recording WHERE title = ?');
    try{
      $q->execute(array($title));
      $result = $q->fetchAll();
      print_r($result);
    }catch(PDOException $e) {
      print_r($e);
      $db->rollback();
      return false;
    }
  }
  return false;
  }

  public function setID($newID){
    if(empty($newID)) return false;

    $this->id = $newID;
    return $this->id;
  }

  public function getID(){
    return $this->id;
  }

  public function setTitle($newTitle){
    if(empty($newTitle)) return false;

    $this->title = $newTitle;
    return $this->newTitle;
  }

  public function getTitle(){
    return $this->title;
  }

  public function setVersion($newVersion){
    if(empty($newVersion)) return false;

    $this->version = $newVersion;
    return $this->version;
  }

  public function getVersion(){
    return $this->version;
  }

  public function setLanguage($newLanguage){
    if(empty($newLanguage)) return false;

    $this->language = $newLanguage;
    return $this->language;
  }

  public function getLanguage(){
    return $this->language;
  }

  public function setNarration_type($newNarration_type){
    if(empty($newNarration_type)) return false;

    $this->narration_type = $newNarration_type;
    return $this->narration_type;
  }

  public function getNarration_type(){
    return $this->narration_type;
  }

  public function setRunning_time($newRunning_time){
    if(empty($newRunning_time)) return false;

    $this->running_time = $newRunning_time;
    return $this->running_time;
  }

  public function getRunning_time(){
    return $this->running_time;
  }

  public function setZip_file_size($newZip_file_size){
    if(empty($newZip_file_size)) return false;

    $this->zip_file_size = $newZip_file_size;
    return $this->zip_file_size;
  }

  public function getZip_file_size(){
    return $this->zip_file_size;
  }

  public function setCatalog_date($newCatalog_date){
    if(empty($newCatalog_date)) return false;

    $this->catalog_date = $newCatalog_date;
    return $this->catalog_date;
  }

  public function getCatalog_date(){
    return $this->catalog_date;
}

public function setWebsite_link($newWebsite_link){
  if(empty($newWebsite_link)) return false;

  $this->website_link = $newWebsite_link;
  return $this->website_link;
}

public function getWebsite_link(){
  return $this->website_link;
}

}
 ?>
