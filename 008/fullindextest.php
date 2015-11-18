<?php

require_once('config.php');
require_once('recording.php');

if(isset($_POST['create'])){
  $created = new Recording($_POST['title'], $_POST['version'], $_POST['language'], $_POST['narration_type'], $_POST['running_time'], $_POST['zip_file_size'], $_POST['catalog_date'], $_POST['website_link']);
  $created->create();
}
elseif(isset($_POST['delete'])){
  $deleted = new Recording($_POST['id']);
  $deleted->delete();

}
elseif(isset($_POST['update'])){
  $updated = new Recording($_POST['title'], $_POST['version'], $_POST['language'], $_POST['narration_type'], $_POST['running_time'], $_POST['zip_file_size'], $_POST['catalog_date'], $_POST['website_link'], $_POST['id']);
  $updated->update();
}
elseif(isset($_POST['find'])){
  $searched = new Recording($_POST['title']);
  $searched->find();
}
elseif(isset($_POST['list'])){
  $listed = new Recording();
  $listed->recording_list();
}
else {
  echo 'Please enter information into the form.';
}
?>

<html>
  <head>
    <title>LibriVox Recordings</title>
  </head>
  <body>
    To CREATE a New Recording Entry in the Database:<br/><br/>
    <form method="POST" action="">
      Enter the title of the recording:
      <input type="text" name="title"></input><br/>
      Enter the version of the recording (if no number given, use 1):
      <input type="text" name="version"></input><br/>
      Enter the language of the recording:
      <input type="text" name="language"></input><br/>
      Enter the narration type of the recording (Solo, Collaborative, Dramatic):
      <input type="text" name="narration_type"></input><br/>
      Enter the running time of the recording (hh:mm:ss):
      <input type="text" name="running_time"></input><br/>
      Enter the zip file size of the recording:
      <input type="text" name="zip_file_size"></input><br/>
      Enter the catalog date of the recording (yyyy-mm-dd):
      <input type="text" name="catalog_date"></input><br/>
      Enter the website link of the recording:
      <input type="text" name="website_link"></input><br/>
      <input type="submit" name="create" value="create"></input><br/>
      </form>

      <?php if(isset($created)){ ?>
        <p>The last recording created was "<?php echo $created->getTitle(); ?>".  The following were the values given:
        Title: <?php echo $created->getTitle();?>, Version: <?php echo $created->getVersion();?>, Language: <?php echo $created->getLanguage();?>, Narration Type: <?php echo $created->getNarration_type();?>, Running Time: <?php echo $created->getRunning_time();?>, Zip File Size: <?php echo $created->getZip_file_size();?>, Catalog Date: <?php echo $created->getCatalog_date();?>
        , Website Link: <?php echo $created->getWebsite_link();?>, and ID:<?php echo $created->getID();?>.</p>
        <?php }else{
          echo 'Please enter information into the form to create a new recording entry.';
        }?>
      <br/><br/>
      To DELETE a Recording Entry in the Database:<br/><br/>
      <form method="POST" action="">
        Enter the id of the recording:
        <input type="text" name="id"></input><br/>
        <input type="submit" name="delete" value="delete"></input><br/>
        </form>

          <?php if(isset($deleted)){ ?>
            <p>The last recording deleted was ID"<?php echo $_POST['id']; ?>".
              <?php }else{
                echo 'Please enter an id into the form to delete a recording entry.';
              }?>
        <br/><br/>
        To UPDATE a Recording in the Database:<br/><br/>
        <form method="POST" action="">
            Please fill in the updated information in the following fields:
            Title: <input type="text" name="title" value="title"></input><br /><br />
            Version: <input type="text" name="version" value="version"></input><br /><br />
            Language: <input type="text" name="language" value="language()"></input><br /><br />
            Narration Type: <input type="text" name="narration_type" value="narration_type"></input><br /><br />
            Running Time: <input type="text" name="running_time" value="running_time"></input><br /><br />
            Zip File Size: <input type="text" name="zip_file_size" value="zip_file_size"></input><br /><br />
            Catalog Date: <input type="text" name="catalog_date" value="catalog_date"></input><br /><br />
            Website Link: <input type="text" name="website_link" value="website_link"></input><br /><br />
            What is the ID for the recording that is in need of an update?
            <input type="text" name="id" value="id"></input><br/>
            <input type="submit" name="update" value="update">
          </form>

          <?php
            if(isset($updated)){?>
            <p>The last record successfully updated was <?php $_POST['title']?>.<p>
            <?php }else{
            echo 'Please choose the id of a recording to update.';
          }?>




        Which LibriVox recording are you looking for?:<br/><br/>
        <form method="POST" action="">
          Enter the title of the recording:
          <input type="text" name="title"></input><br/>
          <input type="submit" name="search" value="search"></input><br/>
          </form>

          <?php if(isset($searched)){
            echo $searched->find($_POST['search']);
          }else{
            echo 'Please search for a LibriVox recording by title.';
          }?>
          <br/><br/>
        To see all LibriVox recordings currrently in the database:
        <input type="submit" name="list" value="list"></input><br/>

        <?php if(isset($listed)){
          echo $listed = Recording::recording_list();
        }else{
          echo ' ';
        }?>



</body>
</html>
