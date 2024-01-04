console.log('fetch template')

// sidenav.html 가져오기
fetch("sidenav.html")
  .then(response => {
  return response.text()
  })
  .then(data => {
  document.getElementById('sidenav-main').innerHTML = data;
});

// sidenav.html 가져오기
fetch("topnav.html")
  .then(response => {
  return response.text()
  })
  .then(data => {
  document.getElementById('topnav').innerHTML = data;
});

// footer.html 가져오기
fetch("footer.html")
  .then(response => {
  return response.text()
  })
  .then(data => {
  document.querySelector("footer").innerHTML = data;
});


 