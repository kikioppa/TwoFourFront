<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <title>Page Not Found</title>
        <!--[if lt IE 9]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>

            * {
                margin: 0;
                line-height: 1.5;
            }

            html {
                color: #888;
                font-family: sans-serif;
                text-align: center;
            }

            body {
                left: 50%;
                margin: -43px 0 0 -150px;
                position: absolute;
                top: 50%;
                width: 300px;
            }

            h1 {
                color: #555;
                font-size: 2em;
                font-weight: 400;
            }

            p {
                line-height: 1.2;
            }

            @media only screen and (max-width: 270px) {

                body {
                    margin: 10px auto;
                    position: static;
                    width: 95%;
                }

                h1 {
                    font-size: 1.5em;
                }

            }

        </style>
    </head>
    <body>
        <h1>Page Not Found</h1>
        <p>Sorry, but the page you were trying to view does not exist.</p>
    </body>
</html>
<!-- IE requires 512+ bytes: http://www.404-error-page.com/404-error-page-too-short-problem-microsoft-ie.shtml -->