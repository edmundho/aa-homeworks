document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let ctx = canvas.getContext('2d');
  ctx.fillStyle = 'lightgray';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.fillStyle = 'aqua';
  ctx.arc(389, 359, 155, 1, 5);
  ctx.strokeStyle = 'blue';
  ctx.fill();
  ctx.lineWidth = 9;
  ctx.stroke();

  ctx.beginPath();
  ctx.fillStyle = 'violet';
  ctx.moveTo(329, 169);
  ctx.lineTo(99, 399);
  ctx.lineTo(699, 339);
  ctx.closePath();
  ctx.fill();
  ctx.strokeStyle = 'purple';
  ctx.stroke();

  ctx.fillStyle = 'orange';
  ctx.beginPath();
  ctx.moveTo(99,99);
  ctx.bezierCurveTo(200, -388, -288, 999, 409, 29);
  ctx.lineTo(99,99);
  ctx.lineWidth = 5;
  ctx.fill();
  ctx.strokeStyle = 'yellow';
  ctx.stroke();
});

