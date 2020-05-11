const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

exports.helloWorld = functions.https.onRequest((request, response) => {
  response.send({ data: 'Hello from Firebase' });
});

exports.userInfo = functions.https.onRequest((req, res) => {
  var db = admin.firestore();
  db.collection('Users')
    .doc('1234')
    .get()
    .then((snapshot) => {
      res.send(snapshot.data());
      return;
    })
    .catch((reason) => {
      res.send('Error: ' + reason);
    });
});
