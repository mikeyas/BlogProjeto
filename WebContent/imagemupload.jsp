<html>
<head>
<title>UPLOAD IMAGEM</title>
</head>
<body>
<h3>Imagem Upload:</h3>
Selecione a imagem para upload: <br />
<form action="UploadServlet" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</body>
</html>