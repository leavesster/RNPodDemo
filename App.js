/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  NativeModules,
  NativeEventEmitter
} from 'react-native';
const JSManager = NativeModules.JSManager;
const {JSEventEmitter} = NativeModules;
const JSManagerEmitter = new NativeEventEmitter(JSEventEmitter)

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

export default class App extends Component<{}> {

  componentDidMount(){
    JSManager.sayHello('K', 'words');
    JSManager.returnFunction((err, result) =>{
      console.log('returnFunction');
      if (err) {
        console.log(err);
      } else {
        console.log(result);
      }
    });
    JSManager.findEvents().then(result => {
      console.log('promise');
      console.log(result);
    }).catch(err => {
      console.log('promise');
      console.log(err);
    })
    this.subscription = JSManagerEmitter.addListener(
      'EventReminder',
      (reminder) => {console.log(reminder, this)},
    );
    this.testScription = JSManagerEmitter.addListener(
      "EventLog",(userinfo) => console.log(userinfo)
    );
  }

  componentWillUnmount(){
    this.subscription.remove();
    this.testScription.remove();
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit App.js
        </Text>
        <Text style={styles.instructions}>
          {instructions}
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
