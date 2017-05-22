<%-- 
    Document   : getPostData
    Created on : May 22, 2017, 5:02:20 PM
    Author     : thuctap02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lấy các dữ liệu của post</title>
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
    </head>
    <body>

        <div class="container">
            <div style="margin-top: 100px" class="panel panel-primary">
                <div class="panel panel-heading">
                    Lấy reaction của post
                </div>

                <div class="panel panel-body">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="post_id">Post ID: </label>
                        <div class="col-sm-10">
                            <input id="post_id" value="216311481960_10154560014201961" class="form-control" id="email" placeholder="Nhập post ID">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="btnCount" class="btn btn-default">Đếm</button>
                        </div>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Like</th>
                                <th>Love</th>
                                <th>Wow</th>                            
                                <th>Haha</th>
                                <th>Sad</th>
                                <th>Angry</th>              
                                <th>Total</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="like_count"></td>
                                <td id="love_count"></td>
                                <td id="wow_count"></td>
                                <td id="haha_count"></td>
                                <td id="sad_count"></td>
                                <td id="angry_count"></td>
                                <td id="total_count"></td> 
                            </tr>

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#btnCount').on('click', function () {

                    var postID = $('#post_id').val();
                    FB.api(
                            '/' + postID + '/',
                            'GET',
                            {
                                "fields": "reactions.type(LIKE).limit(0).summary(1).as(like),reactions.type(WOW).limit(0).summary(1).as(wow),reactions.type(SAD).limit(0).summary(1).as(sad),reactions.type(LOVE).limit(0).summary(1).as(love),reactions.type(HAHA).limit(0).summary(1).as(haha),reactions.type(ANGRY).limit(0).summary(1).as(angry)",
                                "access_token": "EAACEdEose0cBAL4dWqYvKl7lxRGOXyFnvJOyyt9eyAjRMfdCFzqfKmDm4KuJdCK7ZAIFfT7h33OtvH9i27o2RZCkO7LHluOOJEZCNKTaDrCnPztQKlBXZC8GQlJIqSZA6uU3SAzy1giWB65qK9ZBXmHCrPNECVyiqvxCsJPMs7ZBCZAkkb61ha8uA3QxbVBttowZD"
                            },
                    function (response) {
                        console.log(response);
                        var total = 0;
                        var like_count = response.like.summary.total_count;
                        total += like_count;
                        var love_count = response.love.summary.total_count;
                        total += love_count;
                        var wow_count = response.wow.summary.total_count;
                        total += wow_count;
                        var haha_count = response.haha.summary.total_count;
                        total += haha_count;
                        var sad_count = response.sad.summary.total_count;
                        total += sad_count;
                        var angry_count = response.angry.summary.total_count;
                        total += angry_count;
                        $('#like_count').text(like_count);
                        $('#love_count').text(love_count);
                        $('#wow_count').text(wow_count);
                        $('#haha_count').text(haha_count);
                        $('#sad_count').text(sad_count);
                        $('#angry_count').text(angry_count);
                        $('#total_count').text(total);
                    }
                    );
                });
            });
        </script>
    </body>
</html>
