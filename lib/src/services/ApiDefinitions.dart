
class ApiDefinition {

//static String wsProyects = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/inventario/projectsid';
//static String wsInventToProyect = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/inventario/projects/';
//static String wsInventToAgrupado = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/inventario/projectsAgrup/';
//static String wsInventToDetalleAgrupado = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/inventario/projectsAgrup/';
//static String wsDetalleAgrupado = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/inventario/DetailsAgrup/';
//static String wsUpdateInventario = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/inventario/DetailsAgrup/Update/';
//static String wsLoginUser = 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180/user/';


static String wsProyects = ipServer + '/inventario/projectsid';
static String wsInventToProyect = ipServer + '/inventario/projects/';
static String wsInventToAgrupado = ipServer + '/inventario/projectsAgrup/';
static String wsInventToDetalleAgrupado = ipServer + '/inventario/projectsAgrup/';
static String wsDetalleAgrupado = ipServer + '/inventario/DetailsAgrup/';
static String wsUpdateInventario = ipServer + '/inventario/DetailsAgrup/Update/';
static String wsLoginUser= ipServer + '/user/';
static String wsLoginValidateUser= ipServer + '/user/validate';
static String wsLoginUserUpdate= ipServer + '/user/Update/';
static String wsCatalogos= ipServer + '/inventario/catalogo/';
static String wsInsertInvet= ipServer + '/inventario/insert/';

static String ipServer= 'http://192.168.0.6:8180';
//static String ipServer= 'http://ec2-3-15-143-127.us-east-2.compute.amazonaws.com:8180';


}