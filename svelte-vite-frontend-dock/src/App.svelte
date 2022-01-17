<script>
  // External Libs
  import { onMount } from "svelte";
  // Pages
  import Home from "./pages/home.svelte";
  import NotFound from "./pages/404.svelte";
  import Profile from "./pages/profile.svelte";
  import Scenarios from "./pages/scenarios.svelte";
  // Components
  import NavBar from "./components/nav-bar.svelte";
  import Loader from "./components/loader.svelte";
  import Route from "./components/pager/route.svelte";
  import Router from "./components/pager/router.svelte";
  // Services
  import { useAuth0 } from "./services/auth0";

  let page;
  let params;

  let {
    auth0Client,
    isLoading,
    isAuthenticated,
    user,
    login,
    initializeAuth0,
    createAuth0Client,
  } = useAuth0;

  const authenticationGuard = (ctx, next) => {
    if ($isAuthenticated) {
      next();
    } else {
      login({ appState: { targetUrl: ctx.pathname } });
    }
  };

  const onRedirectCallback = (appState) => {
    window.history.replaceState(
      {},
      document.title,
      appState && appState.targetUrl
        ? appState.targetUrl
        : window.location.pathname
    );
  };

  onMount(async () => {
    await initializeAuth0({ onRedirectCallback });
  });
</script>

{#if $isLoading}
  <div class="page-layout">
    <Loader />
  </div>
{/if}

{#if !$isLoading}
  <div class="page-layout">
    <NavBar />
    <div class="page-layout__content">
      <Router>
        <Route path="/" component={Home} />
        <Route
          path="/profile"
          component={Profile}
          middleware={[authenticationGuard]}
        />
        <Route
          path="/scenarios"
          component={Scenarios}
          middleware={[authenticationGuard]}
        />
        <!-- <Route
          path="/external-api"
          component={ExternalApi}
          middleware={[authenticationGuard]}
        /> -->
        <Route path="*" component={NotFound} />
      </Router>
    </div>
    <!-- <Footer /> -->
  </div>
{/if}