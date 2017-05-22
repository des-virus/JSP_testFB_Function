
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Trang test comment hình ảnh</title>
        <script type="text/javascript">
            window.fbAsyncInit = function () {
                FB.init({
                    appId: '659374067600518',
                    xfbml: true,
                    version: 'v2.8'
                });
                FB.AppEvents.logPageView();
            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <!-- CDN -->
        <!-- Google jQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Font awesome-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <script>

        </script>
    </head>
    <body>
        <div class="container">
            <br/>
            <br/>
            <br/>
            <br/>
            <div id="response">

            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="imgLink">Link ảnh: </label>
                <div class="col-sm-10"> 
                    <input value="http://hinhnendepnhat.net/wp-content/uploads/2017/02/nhung-hinh-anh-dep-va-buon.jpg" type="text" class="form-control" id="imgLink" placeholder="Nhập link ảnh">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="imgLink">Comment ID: </label>
                <div class="col-sm-10"> 
                    <input value="1909988105911075_1910571892519363" type="text" class="form-control" id="commentID" placeholder="Nhập comment ID">
                </div>
            </div>
            <div class="form-group"> 
                <div class="col-sm-offset-2 col-sm-10">
                    <button onclick="postComment()" class="btn btn-default">Comment</button>
                </div>
            </div>
        </div>
        <script>
            function postComment() {
                var commentID = $('#commentID').val();
                var imgLink = $('#imgLink').val();
                FB.api(
                        "/" + commentID + "/comments",
                        "POST",
                        {
                            "access_token": "EAACEdEose0cBAFjbjkRl2IbzfsfRZCtKkp0QNzHFZBnSMaOJjU40GxPge2WMZB8JHhY1eDR83masxlbqVDkbfKfnPva4h40Dfm9IfgOYzmeIXtNyRXBBQtCRKsGVPaoVvMs3tMqwkQ9D0WXkURyei42xjAeZBzr6X0Vfvbwk8sb3TxzUtEjKTXVRBJm6sQcZD",
                            "message": "Thử post hình ảnh bằng Java",
                            "attachment_url": imgLink
                        },
                function (response) {
                    console.log(response);
                    $('#response').html(response);
                }
                );
            }
        </script>
    </body>
</html>