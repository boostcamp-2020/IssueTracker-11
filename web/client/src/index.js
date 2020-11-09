import React from 'react';
import ReactDOM from 'react-dom';

// TODO : server에서는 app.js인데 client에서는 App.js네요?
import App from './App';

const rootElement = document.getElementById('root');
ReactDOM.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>,
    rootElement,
);
