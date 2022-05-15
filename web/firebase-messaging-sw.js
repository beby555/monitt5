importScripts("https://www.gstatic.com/firebasejs/9.6.11/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.11/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDB1oKp1I-xp25O24DUvFOhukTauZ2xURY",
  authDomain: "mmtd-9cedf.firebaseapp.com",
  databaseURL: "https://mmtd-9cedf-default-rtdb.firebaseio.com",
  projectId: "mmtd-9cedf",
  storageBucket: "mmtd-9cedf.appspot.com",
  messagingSenderId: "950705029475",
  appId: "1:950705029475:web:3bcdc7d31146b39b619356",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});