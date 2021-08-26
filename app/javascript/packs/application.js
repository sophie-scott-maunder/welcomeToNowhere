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

window.addEventListener("DOMContentLoaded", () => {
  if (document.getElementsByClassName("hand").length) {
    setInterval(() => {
      document.getElementsByClassName("hand")[0].classList.toggle("alt");
    }, 3000);
  }

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

  var initHeight = window.innerHeight;
  var layers = document.getElementsByClassName("parallax");
  var title = document.querySelector(".heading h1");
  var foreground = document.getElementsByClassName("foreground")[0];
  var midground = document.getElementsByClassName("midground")[0];
  var background = document.getElementsByClassName("background")[0];

  for (var i = 0; i < layers.length; i++) {
    layers[i].setAttribute(
      "style",
      "background-position-y: " + -(1070 - initHeight) + "px;"
    );
  }

  const speeds = [40, 16, 26, 36, 49, 69];

  const aminate_backround = () => {
    var top = window.pageYOffset;

    title.setAttribute(
      "style",
      "transform: translate3d(0px, " +
        -((top * 40) / 100) +
        "px, 0px); background-position-y: " +
        -(1070 - initHeight) +
        "px;"
    );

    foreground.setAttribute(
      "style",
      "transform: translate3d(0px, " +
        -((top * 30) / 100) +
        "px, 0px) scale(" +
        (1 + top / 2000) +
        "); background-position-y: " +
        -(1070 - initHeight) +
        "px;"
    );

    top > 950 && foreground.classList.add("hidden");
    top < 950 && foreground.classList.remove("hidden");

    midground.setAttribute(
      "style",
      "transform: translate3d(0px, " +
        -((top * 26) / 100) +
        "px, 0px); background-position-y: " +
        -(1070 - initHeight) +
        "px;"
    );

    background.setAttribute(
      "style",
      "transform: translate3d(0px, " +
        -((top * 16) / 100) +
        "px, 0px); background-position-y: " +
        -(1070 - initHeight) +
        "px;"
    );
  };

  window.addEventListener("scroll", () => {
    window.requestAnimationFrame(aminate_backround);
  });
});
