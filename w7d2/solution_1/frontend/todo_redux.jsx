import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

import applyMiddleware from 'redux';

// const addLoggingToDispatch = (store) => {
//   const storeDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log(store.getState());
//   };
// }

function addLoggingToDispatch (store) {
  return function (next) {
    return function (action) {
      console.log(store.getState());
      console.log(action);
      next(action);
      console.log(store.getState());
    };
  };
}


const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((mw) => {
    dispatch = mw(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  store = applyMiddlewares(store, addLoggingToDispatch);
  
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
