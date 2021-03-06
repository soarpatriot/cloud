
window.THREE = require("three")


var camera, scene, renderer;
var geometry, material, mesh;

init();
animate();

function init() {

    camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
    camera.position.z = 1000;

    scene = new THREE.Scene();

    geometry = new THREE.BoxGeometry(200, 200, 200);
    material = new THREE.MeshBasicMaterial({
        color: 0xff0000,
        wireframe: true
    });

    mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);

    renderer = new THREE.WebGLRenderer();
    var screenWidth = window.innerWidth;
    resize(renderer, screenWidth)
    if(document.getElementById("model")){
      document.getElementById("model").appendChild(renderer.domElement);
    }

}
window.onresize = resize;
function resize(){
  var width = window.innerWidth;
  renderer.setSize(width, width * 0.56);
}
function animate() {

    requestAnimationFrame(animate);

    mesh.rotation.x += 0.01;
    mesh.rotation.y += 0.02;

    renderer.render(scene, camera);

} 
