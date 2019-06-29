var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i, slides, demo, height;
    var all = document.getElementsByClassName('demo');
    var captionText = document.getElementById('caption');
    var main = document.getElementById('main');
    main.style.padding = 0;
    if (n > all.length) {slideIndex = 1}
    if (n < 1) {slideIndex = all.length}
    for (i = 0; i < all.length; i++) {
        all[i].classList.remove('active');
    }

    demo = document.getElementsByClassName('demo')[slideIndex - 1];
    demo.classList.add('active');
    main.src = demo.src;
    captionText.innerHTML = demo.alt;
    main.style.display = 'block';
    height = main.offsetHeight;

    if (height < 600) {
        main.style.paddingTop = (600 - height) / 2 + 'px';
        main.style.paddingBottom = (600 - height) / 2 + 'px'; 
    } else {
        main.style.paddingTop = 0;
        main.style.paddingBottom = 0;
    }
}

function toggleShut() {
    var all = document.getElementsByClassName('row')[0];
    var shut = document.getElementsByClassName('shut')[0];

    if (all.style.display == 'block') {
        all.style.display = 'none';
        shut.innerHTML = '+ Show All';
    } else {
        all.style.display = 'block';
        shut.innerHTML = '- Hide';
    }

}