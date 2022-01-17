<script>
  import CodeSnippet from "../components/code-snippet.svelte";
  import { useAuth0 } from "../services/auth0";

  const { user, isAuthenticated } = useAuth0;

  const userinfo = $user;
</script>

{#if !($isAuthenticated && userinfo)}
  <slot />
{/if}

{#if $isAuthenticated && userinfo}
  <div class="content-layout">
    <h1 class="content__title">Scenarios</h1>
    <div class="content__body">
      {JSON.stringify({ scenario: 'this would be a scenario'})}
    </div>
  </div>
{/if}