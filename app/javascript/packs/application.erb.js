// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
// require('dotenv').config({path:__dirname+'/./../../../.env'})

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// import Client from "shopify-buy";

// // Initializing a client to return content in the store's primary language
// const client = Client.buildClient({
//   domain: "eyegum.myshopify.com",
//   storefrontAccessToken: "3d8921da235f01fcf0d51ad2fb3997e7",
// });

// // Fetch all products in your shop
// client.product.fetchAll().then((products) => {
//   // Do something with the products
//   a = document.getElementById("product");
//   a.style = "background-image: " + products[0].images.src;
//   products[0].images.src;
// });

function importAll(r) {
  return r.keys().map(r);
}

const allImages = importAll(
  require.context(
    "../../assets/images/img_sequence/",
    false,
    /\.(png|jpe?g|svg)$/
  )
);

document.addEventListener("turbolinks:load", () => {
  setTimeout(() => {
    document.getElementById("cover").classList.add("hidden");
  }, 500);
  if (document.getElementsByClassName("hand").length) {
    setInterval(() => {
      document.getElementsByClassName("hand")[0].classList.toggle("alt");
    }, 3000);
  }

  // var initHeight = window.innerHeight;
  var totalImages = allImages.length;
  var images = [];
  for (var i = 1; i < totalImages; i++) {
    var img = new Image();
    img.src = allImages[i];
    images.push(img);
  }
  var canv = document.getElementById("background");
  var splashHeight = document.getElementsByClassName("splash")[0].clientHeight;
  var context = canv.getContext("2d");

  var currentLocation = 0;

  var setImage = function (newLocation) {
    context.drawImage(images[newLocation], 0, 0, 1920, 1080);
  };

  var MouseWheelHandler = function (e) {
    var percent = window.scrollY / splashHeight;
    currentLocation = Math.round(totalImages * percent);
    // See below for the details of this function
    setImage(currentLocation);
  };
  var canvasFillWin = function (e) {
    // var h = 720;
    // var w = 1280;
    // var ratio = h / w;
    // var winW = $(window).width();
    // var winH = $(window).height();
    // var winRatio = winH / winW;
    // if (winRatio > ratio) {
    //   $(canv)
    //     .width(winH / ratio)
    //     .height(winH)
    //     .css({
    //       marginLeft: -winH / ratio / 2 + "px",
    //       left: "50%",
    //       top: "0",
    //       marginTop: "0",
    //     });
    // } else {
    //   $(canv)
    //     .width(winW)
    //     .height(winW * ratio)
    //     .css({
    //       marginLeft: "0",
    //       left: "0",
    //       top: "50%",
    //       marginTop: (-winW * ratio) / 2 + "px",
    //     });
    // }
  };
  window.addEventListener("scroll", MouseWheelHandler, false);
  setImage(1);
  canvasFillWin();
});
