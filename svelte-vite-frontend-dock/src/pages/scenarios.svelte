<script>
  import CodeSnippet from "../components/code-snippet.svelte";
  import { onMount } from "svelte";
  import { useAuth0 } from "../services/auth0";

  const { user, isAuthenticated } = useAuth0;

  const userinfo = $user;

  let newScenario;

  const headers = {
    "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ikg3bXRKSmt5a2stQnBkNGpjZEVzQiJ9.eyJpc3MiOiJodHRwczovL2FmbGFucy51cy5hdXRoMC5jb20vIiwic3ViIjoiREtlUVVtOUp4akdpVDRZaDFDSmdhSjc2eDA4Y05rSlhAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vc3VuZXhwbG9kZWQiLCJpYXQiOjE2NDI0NDA5MzgsImV4cCI6MTY0MjUyNzMzOCwiYXpwIjoiREtlUVVtOUp4akdpVDRZaDFDSmdhSjc2eDA4Y05rSlgiLCJzY29wZSI6InJlYWQ6YWxsLXVzZXJzIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.EvMss2WsGcxYky7J4P4nH9q5vD17Oqm6qc5izDc26ZjlcaYBpM6uhcH6xsmcIqx2OmBRRY8GakM0qqd5QWN0Z13kUx06hufXWVCcmoASad3xcbAVdB6Fket2bImVMswE2anh5HWd3My7wFEjEo74kc2LFVjFQYAMP2dOUhNSENS3J-d4PoDHg0pPWbjqL1xUOpoSH5jF0la0-k3bc6-o3sXzBsrgED3078CwZ2L-Qez9kiMf2a3g-CWtvTofZnJYy_cOGF1Ceg8uwy3n4Hpb2fKvHJGzhneO_ADWzkXs6SnZO-EucASKldL2dbrFmuQFHDqU67HLhZ_P2RpeoE5SAA",
    "Content-Type": "application/json"
  }
  onMount(async() => {
    const res = await fetch('api/scenarios/new', { method: 'GET', headers: headers })
    newScenario = await res.json()
  })
</script>

{#if !($isAuthenticated && userinfo)}
  <slot />
{/if}

{#if $isAuthenticated && userinfo}
  <div class="content-layout">
    <h1 class="content__title">Scenarios</h1>
    <div class="content__body">
      {#if newScenario}
        {JSON.stringify(newScenario)}
      {:else}
        Fetching a new scenario....
      {/if}
    </div>
  </div>
{/if}