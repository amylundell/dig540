<?php

require_once('config.php');
require_once('recording.php');

if(isset($_POST['submit'])){
  $audiobook = new Recording($_POST['title'], $_POST['version'], $_POST['language'], $_POST['narration_type'], $_POST['running_time'], $_POST['zip_file_size'], $_POST['catalog_date'], $_POST['website_link']);
  $audiobook->create();
}
?>

<html>
  <head>
    <title>LibriVox Recordings</title>
  </head>
  <body>
    To Create a New Recording Entry in the Database:<br/><br/>
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
      <input type="submit" name="submit" value="submit"></input><br/>
      </form>

<?php if(isset($audiobook)){ ?>
  <p>The last recording entered was "<?php echo $audiobook->getTitle(); ?>".  It was given ID number <?php echo $audiobook->getID(); ?> in the database.</p>
  <?php }else{ ?>
    <p>The following LibriVox recordings are currently in the database: "<?php echo $audiobook = Recording::recording_list(); ?>". </p>
    <?php } ?>

  </body>
</html>
