<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .content {
  position: relative;
  width: 500px;
  margin: 0 auto;
  padding: 20px;
}
/*.content video {
  width: 100%;
  display: block;
}*/
.content:before {
  content: '<img src="dbs.png" />';
  position: absolute;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 5px;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.outer-container {
    border: 1px dotted black;
    width: 100%;
    height: 100%;
    text-align: center;
}
.inner-container {
    border: 1px solid black;
    display: inline-block;
    position: relative;
}
.video-overlay {
    position: absolute;
    left: 0px;
    top: 0px;
    margin: 10px;
    padding: 5px 5px;
    font-size: 20px;
    font-family: Helvetica;
    color: #FFF;
    background-color: rgba(50, 50, 50, 0.3);
}
/*video {
    width: 1024px;
    height: 610px;
}*/

img {
  opacity: 0.4;
  filter: alpha(opacity=50); /* For IE8 and earlier */
  width: 100%;
    height: 100%;
  /*width: 1024px;
    height: 610px;*/
}
    </style>
      <link rel="stylesheet" type="text/css" href="style.css">
     <script src="js/browser.js"></script>
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
      <!--  <div>
            <div class="content">
  <video id="player" src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" autoplay loop muted></video>
</div>
        </div>-->

<!--           <div class="outer-container">
 <div class="inner-container">
        <div class="video-overlay"><img src="DBS.PNG" /> Buck Bunny - Trailer</div>
        <video id="player" src="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" controls autoplay loop></video>
    </div>
</div>-->
            <div id="container">
    <div id="vid_container">
         <div  class="video-overlay"><img src="overlay.jpg" /><div id="resultdiv">Lifelong Institute - </div></div>
        <video id="video" autoplay playsinline></video>
        <div id="video_overlay"></div>
    </div>                
               <!--   <canvas id="z" height="600px" width="600px"></canvas>-->
    <div id="gui_controls">
       
        <button id="switchCameraButton" name="switch Camera" type="button" aria-pressed="false"></button>
        <button id="takePhotoButton" name="take Photo" type="button"></button>
        <button id="toggleFullScreenButton" name="toggle FullScreen" type="button" aria-pressed="false"></button>
    </div>
  </div> 
       
    </form>

      <script src="js/DetectRTC.min.js"></script>
  <script src="js/adapter.min.js"></script>  
  <script src="js/screenfull.min.js"></script>
  <script src="js/howler.core.min.js"></script>
  <script src="js/main.js"></script>
    <script type="text/javascript">
        var canvas;
        var dataURI;
        var ctx;
        var v;
// if you want to preview the captured image,
        // attach the canvas to the DOM somewhere you can see it.
        $("#takePhotoButton").click(function () {
            window.location = "WebForm3.aspx";
                
        });
        $( document ).ready(function() {
            console.log("ready!");
            canvas = document.createElement('canvas');
            canvas.width = 1024; //$("#video").width;
            canvas.height = 610; //$("#video").height;
            
            ctx = canvas.getContext('2d');
            //draw image to canvas. scale to target dimensions
            v = document.getElementById("video");
            console.log(v);


            //var c = document.getElementById("z");
            //var ctx2 = c.getContext('2d');
            //ctx2.drawImage(v, 0, 0, canvas.width, canvas.height);
//convert to desired file format
            //dataURI = canvas.toDataURL('image/jpeg'); // can also use 'image/png'
            //console.log(dataURI);
            var tid = setInterval(mycode, 1000);


});

        function mycode() {
            console.log("timer fired");
            ctx.drawImage(v, 0, 0, canvas.width, canvas.height);
            dataURI = canvas.toDataURL('image/jpeg'); // can also use 'image/png'
            //console.log(dataURI);
            console.log(dataURI);
            const rembrandt = new Rembrandt({
                // `imageA` and `imageB` can be either Strings (file path on node.js,
                // public url on Browsers) or Buffers
                imageA: 'overlay.jpg',
                imageB: dataURI,

                // Needs to be one of Rembrandt.THRESHOLD_PERCENT or Rembrandt.THRESHOLD_PIXELS
                thresholdType: Rembrandt.THRESHOLD_PERCENT,

                // The maximum threshold (0...1 for THRESHOLD_PERCENT, pixel count for THRESHOLD_PIXELS
                maxThreshold: 0.01,

                // Maximum color delta (0...255):
                maxDelta: 20,

                // Maximum surrounding pixel offset
                maxOffset: 0,

                renderComposition: true, // Should Rembrandt render a composition image?
                compositionMaskColor: Rembrandt.Color.RED // Color of unmatched pixels
            });

            // Run the comparison
            rembrandt.compare()
                .then(function (result) {
                    //console.log('Passed:', result.passed);
                    //console.log('Difference:', (result.threshold * 100).toFixed(2), '%');
                    //console.log('Composition image buffer:', result.compositionImage);
                    var o = (result.threshold * 100).toFixed(2);
                    if (o > 1.5) {
                        $("#resultdiv").html("Difference " + o + '%');

                    }
                    else {
                        $("#resultdiv").html("Difference - " + o + '%');
                        //window.location = "http://www.google.com.sg";
                    }
                    
                    // Note that `compositionImage` is an Image when Rembrandt.js is run in the browser environment
                })
                .catch((e) => {
                    console.error(e);
                });
        }
    </script>
</body>
</html>
