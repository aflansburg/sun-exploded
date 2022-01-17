<script>
  import AuthenticationButton from "./buttons/authentication-button.svelte";
  import { activeRoute } from "./pager/router.svelte";
</script>

<div class="nav-bar__container">
  <nav class="nav-bar">
    <!-- <div class="nav-bar__brand">

    </div> -->
    <div class="nav-bar__tabs">
      <a
        href="/profile"
        class="nav-bar__tab"
        class:nav-bar__tab--active={$activeRoute.path === "/profile"}
      >
        Profile
      </a>
      <a
        href="/scenarios"
        class="nav-bar__tab"
        class:nav-bar__tab--active={$activeRoute.path === "/scenarios"}
      >
        Scenarios
      </a>
    </div>
    <div class="nav-bar__actions">
      <AuthenticationButton />
    </div>
  </nav>
</div>