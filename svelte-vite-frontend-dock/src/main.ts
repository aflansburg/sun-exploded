import App from './App.svelte';
import createAuth0Client from '@auth0/auth0-spa-js';

const app = new App({
  target: document.getElementById('app'),
});

export default app;
