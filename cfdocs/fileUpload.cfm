<form method="post" enctype="multipart/form-data">
  <input type="file" name="fileInput">
  <button type="submit">Upload</button>
</form>

<cfscript>
  if( structKeyExists( form, "fileInput" )) {
    try {

      uploadedFile = fileUpload( "./", "fileInput", "image/jpeg,image/pjpeg", "MakeUnique" );

      // do stuff with uploadedFile...
    } catch ( coldfusion.tagext.io.FileUtils$InvalidUploadTypeException e ) {
      writeOutput( "This upload form only accepts JPEG files." );
    }
  }
</cfscript>