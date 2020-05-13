const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

const HEADER_AUTH = 'authorization';
const GET = 'GET';
const POST = 'POST';
const COLLECTION_USER = 'User';

exports.helloWorld = functions.https.onRequest((request, response) => {
  response.send({ data: 'NoNO' });
});

exports.userInfo = functions.https.onRequest((req, res) => {
  var db = admin.firestore();
  console.log('TEST');
  console.log(req.headers);
  console.log(req.headers.authorization);
  if (req.method === GET) {
    db.collection(COLLECTION_USER)
      .doc(req.headers.authorization)
      .get()
      .then((snapshot) => {
        let data = snapshot.data();

        if (data === undefined || data.uid === undefined) {
          res.status(404).send();
        } else {
          res.status(200).send(snapshot.data());
        }
        return;
      })
      .catch((reason) => {
        console.log('Error: ' + reason);
        res.status(500).send(reason);
      });
  } else if (req.method === POST) {
    if (req.body.name === undefined || req.body.email === undefined) {
      res.status(400).send();
    }
    let data = {
      name: req.body.name,
      email: req.body.email,
    };
    db.collection(COLLECTION_USER).doc(req.body.uid).set(data);
    res.status(201).send(data);
  }
});
