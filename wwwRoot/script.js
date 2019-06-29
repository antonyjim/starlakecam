
function modalinfo(){
    // Get the modal
    var modal = document.getElementById('modal');

    // Get the image and insert it inside the modal
    var img = document.getElementById('webcam');
    var modalImg = document.getElementById('img01');
    img.onclick = function(){
        modal.style.display = "block";
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
}

function createNewImage(src, index) {
  // This is used to decide whether we need to create a new image elsewhere
  window.app.imagesLoaded++
  var containerDiv = document.createElement('div')
  var imgEl = document.createElement('img')
  var caption = document.createElement('div')

  // Set the styles
  containerDiv.classList.add('mySlides', 'fade')
  caption.classList.add('text')

  // Set the src
  imgEl.src = src
  imgEl.setAttribute('data-index', index)

  // Put it all together
  containerDiv.appendChild(imgEl)
  containerDiv.appendChild(caption)

  document.getElementById('slide-cont').appendChild(containerDiv)
}


window.app = {
  slideIndex: 0,
  imagesLoaded: 0,
  images: []
}
showSlides(window.app.slideIndex);

// Thumbnail image controls
function currentSlide(n) {

  showSlides(window.app.slideIndex = n);
}

function loadImage() {
  var minDate = 1548184510
  var maxDate = new Date()
  var currDate = document.getElementById('active').src
  if (currDate && parseInt(currDate)) {console.log('date')}
}

function showSlides(n) {
  var i;
  window.app.slideIndex += n
  // slides represents the container div around each image
  var slides = document.getElementsByClassName("mySlides");
  var slideIndex = window.app.slideIndex

  // Return to 0
  if ( slideIndex > window.app.images.length - 1 || slideIndex < 0) {
    window.app.slideIndex = 0
    slideIndex = 0
  } else if ( slideIndex > window.app.imagesLoaded) {
    createNewImage(window.app.images[slideIndex], window.app.slideIndex)
  }
  
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  
  slides[slideIndex].style.display = "block"; 
}

function getAllImages(cb) {
  var xhr = new XMLHttpRequest()
  xhr.open('GET', '/images.json')
  xhr.responseType = 'json'
  xhr.onloadend = function(res) {
    if (xhr.status === 200 && xhr.response.images && xhr.response.images.length > 0) {
      console.log(xhr.response.images)
      window.app.images = xhr.response.images
      document.getElementById('active').src = xhr.response.images[0]
    }
  }
  xhr.send()
}

function getTimestamp() {
  var months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ]
  var xhr = new XMLHttpRequest()
  xhr.open('GET', 'https://thq.anthonyjund.com/slc/info')
  xhr.responseType = 'json'
  xhr.onloadend = function() {
    if (xhr.status === 200 && xhr.response.lastModified) {
      var dat = new Date(xhr.response.lastModified)
      document.getElementById('timestamp').innerText = 
        'Last Updated: ' 
        + months[dat.getMonth()] 
        + ' ' 
        + dat.getDate() 
        + ' '
        + dat.getFullYear()
        + ' '
        + dat.toTimeString().slice(0, 5)
    }
  }

  xhr.send()
}

(function() {
  getAllImages()
  getTimestamp()
})()