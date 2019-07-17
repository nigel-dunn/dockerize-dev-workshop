<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

$app = new \Slim\App;
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");

    return $response;
});
$app->get('/events/', function (Request $request, Response $response, array $args) {
    $connection = new \mysqli($_ENV['DB_HOST'], $_ENV['DB_USER'], $_ENV['DB_PASSWORD']);
    $connection->select_db($_ENV['DB_NAME']);
    $result = $connection->query("SELECT * FROM events ORDER BY id");

    $response->getBody()->write("<ul>");
    while ($event = $result->fetch_assoc()) {
        $response->getBody()->write("<li>{$event['name']}</li>");
    }
    $response->getBody()->write("</ul>");

    $connection->close();

    return $response;
});
$app->run();
