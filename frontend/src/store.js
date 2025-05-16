import { createStore, applyMiddleware, compose } from 'redux';
import createSagaMiddleware from 'redux-saga';
process.env.NODE_ENV
import rootReducer from './reducers';
import rootSaga from './sagas';

const sagaMiddleware = createSagaMiddleware();

const composeEnhancers =
    (process.env.NODE_ENV === 'development' ? globalThis.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ : null) ||
    compose;

export const store = createStore(rootReducer, composeEnhancers(applyMiddleware(sagaMiddleware)));

sagaMiddleware.run(rootSaga);
