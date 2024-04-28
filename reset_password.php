<html>
  <head>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
     <body>
  

  <script>
        swal({
          icon: "success",
          title: "Bon travail !",
          text: "Vous allez recevoir un nouveau code par mail.",
          buttons: {
            confirm: {
              text: "Cerrar",
              value: true,
              visible: true,
              className: "",
              closeModal: true
            }
          }
        }).then((value) => {
            if (value) {
                window.location = "index.php"; // Redirection vers index.php après la confirmation
            }
        });
    </script>

     </body></html>
