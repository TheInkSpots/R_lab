 <!-- Description: This is a Restful server for test access token and authonization for postman testing  -->
    <?php   
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
    header('Access-Control-Allow-Credentials: true');
    header('Content-Type: application/json');
    header('Access-Control-Max-Age: 86400');
    header('Access-Control-Expose-Headers: Content-Length, X-JSON');
    header('Access-Control-Allow-Headers: *');
    header('Access-Control-Request-Headers: *');
    header('Access-Control-Request-Method: *');
    header('Access-Control-Allow-Methods: *');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Expose-Headers: *');
    header('Access-Control-Max-Age: 86400');
    header('Access-Control-Request-Headers: *');
    header('Access-Control-Request-Method: *');

    $method = $_SERVER['REQUEST_METHOD'];
    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    $input = json_decode(file_get_contents('php://input'),true);
    