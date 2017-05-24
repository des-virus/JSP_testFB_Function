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
            var appID = '659374067600518';
            var appSecrect = 'dd530a30abf42a8391f4943588090d0c';
            var expDate = '5183981';
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
            }(document, 'script', 'facebook-jssdk'));</script>
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

        <style>
            .tooltip-inner {
                white-space:pre-wrap;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div style="margin-top: 100px" class="panel panel-primary">
                <div class="panel panel-heading">
                    Thông tin app
                </div>

                <div class="panel panel-body">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="access_token">Access token: </label>
                        <div class="col-sm-10">
                            <input id="access_token" class="form-control" id="email" placeholder="Access token" value="EAAJXsn0SzIYBAAAmZCHcvUnVZAjbSRleDoZCeHs2ZA2Q5xMshcnn20v1qnzpe8TyXUs26POe3z748VvcWGkp01bwZB9lq3ZBlXQE7LrX8J8IPokrZCaxRdiZAi4Ki72VMCwZAcxVRkFVMqdU1POUgNaFLeXnu3PyJBNlpEZApiEl5exgZDZD">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="experied_time">Hết hạn: </label>
                        <div class="col-sm-10">
                            <input id="experied_time" value="" class="form-control" id="email" placeholder="Thời gian hết hạn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="remaining">Còn lại: </label>
                        <div class="col-sm-10">
                            <input id="remaining" value="" class="form-control" id="email" placeholder="Thời gian còn lại">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="btnChangeToken" class="btn btn-default">Đổi token</button>
                        </div>
                    </div>

                    <div class="form-group pull-right">

                        Lần cập nhật cuối: <span class="strong" id="last_update_token"></span>

                    </div>


                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel panel-heading">
                    Lấy reaction của post
                </div>

                <div class="panel panel-body">
<!--                    <div class="form-group">
                        <label class="control-label col-sm-2" for="post_id">Post ID: </label>
                        <div class="col-sm-10">
                            <input id="post_id" value="216311481960_10154560014201961" class="form-control" id="email" placeholder="Nhập post ID">
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="post_number">Lượng post: </label>
                        <div class="col-sm-10">
                            <input id="post_number" value="10" class="form-control" id="email" placeholder="Nhập post ID">
                        </div>
                    </div>
                    <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="btnCount" class="btn btn-default">Thống kê</button>
                        </div>
                    </div>

                    <div class="form-group pull-right">

                        Lần cập nhật cuối: <span class="bold" id="last_update"></span>

                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Người đăng</th>
                                <th>Nội dung</th>
                                <th>Share</th>
                                <th>Like</th>
                                <th>Love</th>
                                <th>Wow</th>                            
                                <th>Haha</th>
                                <th>Sad</th>
                                <th>Angry</th>              
                                <th>Total</th>   



                            </tr>
                        </thead>
                        <tbody id="tblBody">
                            <!--                            <tr>
                                                            <td id="like_count"></td>
                                                            <td id="love_count"></td>
                                                            <td id="wow_count"></td>
                                                            <td id="haha_count"></td>
                                                            <td id="sad_count"></td>
                                                            <td id="angry_count"></td>
                                                            <td id="total_count"></td> 
                                                        </tr>-->

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#btnChangeToken').on('click', function () {
                    console.log(getTimeRemaining(expDate));
                    var old_token = $('#access_token').val();
                    $.getJSON('https://graph.facebook.com/oauth/access_token',
                            {
                                'client_id': appID,
                                'client_secret': appSecrect,
                                'grant_type': 'fb_exchange_token',
                                'fb_exchange_token': old_token
                            }, function (response) {
                        $('#access_token').val(response.access_token);
                        console.log(response);
                    });
                });
                $('#btnCount').on('click', function () {
                    var postID = $('#post_id').val();
                    var token = $('#access_token').val();
                    var postNumber = $('#post_number').val();
                    FB.api(
                            '/1743490559227498/posts',
                            'GET',
                            {
                                "limit": postNumber,
                                'fields': 'id, shares, message,admin_creator ',
                                'access_token': token
                            },
                    function (response) {
                        console.log(response);

                        for (var i = 0; i < response.data.length; i++) {
                            var share = response.data[i].shares == undefined ? 0 : response.data[i].shares.count;
                            var creator = response.data[i].admin_creator.id + ": " + response.data[i].admin_creator.name
                            var message = response.data[i].message;
                            $('#tblBody').append(getRowHTML(response.data[i].id, share, creator, message));
                            getPostReaction(response.data[i].id);
                        }

                        // last updated_time
                        var currentdate = new Date();
                        var datetime = "Last Sync: " + currentdate.getDate() + "/"
                                + (currentdate.getMonth() + 1) + "/"
                                + currentdate.getFullYear() + " @ "
                                + currentdate.getHours() + ":"
                                + currentdate.getMinutes() + ":"
                                + currentdate.getSeconds();
                        $('#last_update').text(currentdate.toLocaleString());
                    }
                    );
                });
                function getPostReaction(postID) {
                    var token = $('#access_token').val();
                    FB.api(
                            '/' + postID + '/',
                            'GET',
                            {
                                "fields": "reactions.type(LIKE).limit(0).summary(1).as(like),reactions.type(WOW).limit(0).summary(1).as(wow),reactions.type(SAD).limit(0).summary(1).as(sad),reactions.type(LOVE).limit(0).summary(1).as(love),reactions.type(HAHA).limit(0).summary(1).as(haha),reactions.type(ANGRY).limit(0).summary(1).as(angry)",
                                "access_token": token
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
                        setRowHTML(postID, like_count, love_count, wow_count, haha_count, sad_count, angry_count, total);
                    });
                }
                function getRowHTML(postID, share, creator, message) {
                    var HTML = '<tr id=' + postID + '>';
                    HTML += '<td id=creator_' + postID + '>' + creator + '</td>';
                    HTML += '<td id=message_' + postID + '>' + message + '<a href="http://fb.com/' + postID + '" target="_blank"> Xem </a></td>';
                    HTML += '<td id=share_count_' + postID + '>' + share + '</td>';
                    HTML += '<td id=like_count_' + postID + '></td>';
                    HTML += '<td id=love_count_' + postID + '></td>';
                    HTML += '<td id=wow_count_' + postID + '></td>';
                    HTML += '<td id=haha_count_' + postID + '></td>';
                    HTML += '<td id=sad_count_' + postID + '></td>';
                    HTML += '<td id=angry_count_' + postID + '></td>';
                    HTML += '<td id=total_count_' + postID + '></td>';



                    HTML += '</tr>';
                    return HTML;
                }

                function setRowHTML(postID, like_count, love_count, wow_count, haha_count, sad_count, angry_count, total_count, share_count, creator, message) {
                    $('#creator_' + postID).text(creator);
                    $('#message_' + postID).text(message);
                    $('#share_count_' + postID).text(share_count);
                    $('#like_count_' + postID).text(like_count);
                    $('#love_count_' + postID).text(love_count);
                    $('#wow_count_' + postID).text(wow_count);
                    $('#haha_count_' + postID).text(haha_count);
                    $('#sad_count_' + postID).text(sad_count);
                    $('#angry_count_' + postID).text(angry_count);
                    $('#total_count_' + postID).text(total_count);



                    //$('#total_count_' + postID).tooltip('hide')
                    //.attr('data-original-title', '123\n123')
                    //.tooltip('fixTitle');
                }

                function convertToUnixTime(time) {

                }

                function convertToNormalTime(time) {
                    var date = new Date(time * 1000);
                    var day = date.getDay();
                    var month = date.getMonth();
                    var year = date.getFullYear();
                    // Hours part from the timestamp
                    var hours = date.getHours();
                    // Minutes part from the timestamp
                    var minutes = "0" + date.getMinutes();
                    // Seconds part from the timestamp
                    var seconds = "0" + date.getSeconds();
                    // Will display time in 10:30:23 format
                    var formattedTime = hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);
                    var formattedDate = day + '/' + month + '/' + year;
                    return formattedDate + ' ' + formattedTime;
                }

                function getTimeRemaining(second) {
                    var second, minute, hour, day, month, year;
                    return t;
                }
            });
        </script>
    </body>
</html>
